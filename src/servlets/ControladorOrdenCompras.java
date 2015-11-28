package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.group7.business.OrdenCompraVO;
import com.group7.business.OrdenPedidoVO;
import com.group7.business.RodamientoVO;

import manager.AdministradorCotizacion;
import manager.AdministradorOrdenCompras;

public class ControladorOrdenCompras extends HttpServlet {

	private List<RodamientoVO> items;
	private List<Integer> cantidades;
	private HttpSession session;
	private static final long serialVersionUID = 1087702007634924546L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		String action = request.getParameter("action");
		String jspPage = "/index.html";

		if (request.getParameter("cancelar4") != null) {
			action = "default";
		}

		else if (request.getParameter("show") != null) {
			action = "show";
		}
		if (request.getParameter("f2Confirmar") != null) {
			action = "save";
		} else if (request.getParameter("f2Cancelar") != null) {
			action = "cancel";
		}
		if (request.getParameter("cancelar4") != null) {
			action = "default";
		}

		else if (request.getParameter("showOC") != null) {
			action = "showOC";
		}

		if ((action == null) || (action.length() < 1)) {
			action = "default";
		}

		if ("default".equals(action)) {
			jspPage = "/index.html";
		}

		// A partir de una OP
		else if ("displayOrdenCompra".equals(action)) {
			List<OrdenPedidoVO> ordenes = new ArrayList<OrdenPedidoVO>();
			ordenes = AdministradorOrdenCompras.getInstancia().getOrdenesPedidos();
			request.setAttribute("ordenesPedidos", ordenes);
			jspPage = "jsp/OrdenCompra/GenerarOC.jsp";
		} else if ("efectuarOrdenDeCompra".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			OrdenPedidoVO op = AdministradorOrdenCompras.getInstancia().getOrdenPedido(nro);
			AdministradorOrdenCompras.getInstancia().generarOrdenDeCompra(op);
		} else if ("show".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			OrdenPedidoVO op = AdministradorOrdenCompras.getInstancia().getOrdenPedido(nro);
			request.setAttribute("orden", op);
			jspPage = "jsp/OrdenCompra/MostrarOP.jsp";

			// Manual
		} else if ("cancel".equals(action)) {
			cerrar();

		} else if ("displayOrdenCompraManual".equals(action)) {
			popularCombos(request);
			jspPage = "jsp/OrdenCompra/GenerarOCManual.jsp";
		} else if ("delete".equals(action)) {
			String del = request.getParameter("delindex");
			int d = (new Integer(del)).intValue();
			items.remove(d);
			cantidades.remove(d);
			session.setAttribute("items", items);
			session.setAttribute("cantidades", cantidades);
			popularCombos(request);
			jspPage = "jsp/OrdenCompra/GenerarOCManual.jsp";
		} else if ("add".equals(action)) {
			boolean existe = false;
			String roda = ((String) request.getParameter("listado"));
			String[] stringRodamiento = roda.split("/");
			Integer cantidad = Integer.valueOf(request.getParameter("cantidad"));
			RodamientoVO unR = AdministradorCotizacion.getInstancia().getRodamiento(stringRodamiento[0],
					stringRodamiento[1]);
			if (items == null && cantidades == null) {
				items = new ArrayList<RodamientoVO>();
				cantidades = new ArrayList<Integer>();
				items.add(unR);
				cantidades.add(cantidad);
			} else {
				for (int i = 0; i < items.size(); i++) {
					RodamientoVO ro = (RodamientoVO) items.get(i);
					Integer cant = (Integer) cantidades.get(i);
					if (ro.getCodigoPieza().equals(unR.getCodigoPieza())
							&& (ro.getCodigoSFK().equals(unR.getCodigoSFK()))) {
						cantidades.set(i, cant + cantidad);
						existe = true;
					}
				}
				if (!existe) {
					items.add(unR);
					cantidades.add(cantidad);
				}
			}
			session.setAttribute("items", items);
			session.setAttribute("cantidades", cantidades);
			popularCombos(request);
			jspPage = "jsp/OrdenCompra/GenerarOCManual.jsp";
		} else if ("save".equals(action)) {
			if (items != null) {
				if (items.size() > 0) {
					AdministradorOrdenCompras.getInstancia().generarOCManual(items, cantidades);
					cerrar();
					request.setAttribute("bandera", true);
				}
			} else {
				request.setAttribute("bandera", false);
			}
			jspPage = "jsp/Generales/Resultado.jsp";
		}

		// Recepcion de mercaderia

		else if ("efectuarRecepcion".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			OrdenCompraVO oc = AdministradorOrdenCompras.getInstancia().traerOC(nro);
			AdministradorOrdenCompras.getInstancia().recepcionDeMercaderia(oc);
		} else if ("showOC".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			OrdenCompraVO oc = AdministradorOrdenCompras.getInstancia().traerOC(nro);
			request.setAttribute("orden", oc);
			jspPage = "jsp/OrdenCompra/MostrarOC.jsp";
		} else if ("displayRecepcion".equals(action)) {
			List<OrdenCompraVO> ordenes = new ArrayList<OrdenCompraVO>();
			ordenes = AdministradorOrdenCompras.getInstancia().getOrdenesCompras();
			request.setAttribute("ordenesCompras", ordenes);
			jspPage = "jsp/OrdenCompra/GenerarRecepcion.jsp";
		}
		dispatch(jspPage, request, response);
	}

	protected void dispatch(String jsp, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (jsp != null) {
			RequestDispatcher rd = request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.toString());
		doPost(request, response);
	}

	private void popularCombos(HttpServletRequest request) {
		List<RodamientoVO> rodamientos = new ArrayList<RodamientoVO>();
		rodamientos = AdministradorCotizacion.getInstancia().getRodamientos();
		request.setAttribute("rodamientos", rodamientos);
	}

	private void cerrar() {
		if (session != null) {
			items.clear();
			cantidades.clear();
			session.invalidate();
		}
	}

}
