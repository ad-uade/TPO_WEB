package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.group7.business.ClienteVO;
import com.group7.business.CotizacionVO;
import com.group7.business.ItemCotizacionVO;
import com.group7.business.RodamientoVO;
import com.group7.business.SolicitudCotizacionVO;

import manager.AdministradorCliente;
import manager.AdministradorCotizacion;

public class ControladorCotizacion extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;
	
	private SolicitudCotizacionVO solicitudCotizacionVO;
	private HttpSession session;

	@SuppressWarnings({ "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		String action = request.getParameter("action");
		String jspPage = "/index.jsp";

		if (request.getParameter("f2Confirmar") != null) {
			action = "save";
		}
		if (request.getParameter("f4Confirmar") != null) {
			action = "aprobarSolicitud";
		} else if (request.getParameter("f2Cancelar") != null) {
			action = "cancel";
		} else if (request.getParameter("validarCliente") != null) {
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(Long.valueOf(request.getParameter("clienteid")));
			session.setAttribute("clienteSeleccionado", c);
			action = "displaysolicitudes";
		} else if (request.getParameter("f3Confirmar") != null) {
			action = "generarCotizacion";
		} else if (request.getParameter("f3Cancelar") != null) {
			action = "default";
		} else if (request.getParameter("validarCotizacion") != null) {
			CotizacionVO c = AdministradorCotizacion.getInstancia().getCotizacion(Integer.valueOf(request.getParameter("nrocotizacion")));
			session.setAttribute("cotizacionSeleccionada", c);
			action = "displaycotizacion";
		} else if (request.getParameter("f4Cancelar") != null) {
			action = "cancelf4";
		}

		if ((action == null) || (action.length() < 1)) {
			action = "default";
		}

		if ("default".equals(action)) {
			jspPage = "/index.jsp";
		} else if ("displaysolicitudes".equals(action)) {
			popularCombos(request);
			jspPage = "jsp/Cotizacion/GenerarSolicitud.jsp";
		} else if ("displaycotizacion".equals(action)) {
			jspPage = "jsp/Cotizacion/AprobarCotizacion.jsp";
		} else if ("displaysolicitud".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			SolicitudCotizacionVO sc = AdministradorCotizacion.getInstancia().getSolicitudCotizacion(nro);
			request.setAttribute("sc", sc);
			jspPage = "jsp/Cotizacion/MostrarSolicitudCotizacion.jsp";
		}

		else if ("obtenerSolicitudes".equals(action)) {
			List<SolicitudCotizacionVO> cotizaciones = new ArrayList<SolicitudCotizacionVO>();
			cotizaciones = AdministradorCotizacion.getInstancia().getSolicitudesCotizacion();
			request.setAttribute("solicitudes", cotizaciones);
			jspPage = "jsp/Cotizacion/GenerarCotizacion.jsp";
		}

		else 
//			if ("generarCotizacion".equals(action)) {
//			Integer diasValidez = Integer.valueOf(request.getParameter("diasValidez"));
//			Integer nro = Integer.valueOf(request.getParameter("listado"));
//			SolicitudCotizacionVO sc = AdministradorCotizacion.getInstancia().getSolicitudCotizacion(nro);
//			if (diasValidez != null && sc != null) {
//				AdministradorCotizacion.getInstancia().confirmarSolicitud(sc, diasValidez);
//				request.setAttribute("bandera", true);
//			} else {
//				request.setAttribute("bandera", false);
//			}
//			jspPage = "jsp/Generales/Resultado.jsp";
//		} else 
			if ("cancel".equals(action)) {
			cerrar();
		} else if ("cancelf4".equals(action)) {
			if (session != null) {
				session.invalidate();
				solicitudCotizacionVO = null;
			}
		} else if ("aprobarSolicitud".equals(action)) {
			List<String> listaItems = (List<String>) session.getAttribute("itemsElegidos");
			CotizacionVO c = (CotizacionVO) session.getAttribute("cotizacionSeleccionada");
			List<ItemCotizacionVO> items = new ArrayList<ItemCotizacionVO>();
			if (listaItems != null) {
				if (listaItems.size() > 0) {
					for (int i = 0; i < listaItems.size(); i++) {
						String roda = ((String) listaItems.get(i));
						String[] stringRodamiento = roda.split("/");
						for (int j = 0; j < c.getItems().size(); j++) {
							ItemCotizacionVO it = new ItemCotizacionVO();
							it.setRodamiento(c.getItems().get(j).getRodamiento());
							it.setCantidad(c.getItems().get(j).getCantidad());
							it.setNroCotizacion(c.getNroCotizacion());
							it.setProveedor(c.getItems().get(j).getProveedor());
							it.setPrecio(c.getItems().get(j).getPrecio());
							if (c.getItems().get(j).getRodamiento().getCodigoSFK().equals(stringRodamiento[0]) && c.getItems().get(j).getRodamiento().getCodigoPieza().equals(stringRodamiento[1])) {
								it.setEstado("Aprobado");
							} else {
								it.setEstado("No Aprobado");
							}
							items.add(it);
						}
					}
					CotizacionVO coti = c;
					coti.setItems(items);
					AdministradorCotizacion.getInstancia().aprobarCotizacion(coti);
				}
			}

		} else if ("save".equals(action)) {
			ClienteVO c = (ClienteVO) session.getAttribute("clienteSeleccionado");
			solicitudCotizacionVO = (SolicitudCotizacionVO) session.getAttribute("solicitudCotizacionVO");
			solicitudCotizacionVO.setCliente(c);
			solicitudCotizacionVO.setFecha(Calendar.getInstance().getTime());
			solicitudCotizacionVO.setOficinaVentasVO(c.getODV());
			AdministradorCotizacion.getInstancia().guardarSolicitudCotizacion(solicitudCotizacionVO);
			cerrar();
			request.setAttribute("bandera", true);
			jspPage = "jsp/index.jsp";
		} else if ("delete".equals(action)) {
			String del = request.getParameter("delindex");
			session.setAttribute("solicitudCotizacionVO", solicitudCotizacionVO);
			popularCombos(request);
			jspPage = "jsp/Cotizacion/GenerarSolicitud.jsp";

		} else if ("add".equals(action)) {
			String roda = ((String) request.getParameter("listado"));
			String[] stringRodamiento = roda.split("/");
			RodamientoVO rodamiento = AdministradorCotizacion.getInstancia().getRodamiento(stringRodamiento[0], stringRodamiento[1]);
			Integer cantidad  = Integer.valueOf(request.getParameter("cantidad"));
			solicitudCotizacionVO = (SolicitudCotizacionVO) session.getAttribute("solicitudCotizacionVO");
			if (solicitudCotizacionVO == null){
				solicitudCotizacionVO = new SolicitudCotizacionVO();
			}
			solicitudCotizacionVO.add(rodamiento, cantidad);
			session.setAttribute("solicitudCotizacionVO", solicitudCotizacionVO);
			popularCombos(request);
			jspPage = "jsp/Cotizacion/GenerarSolicitud.jsp";
		} else if ("DesaprobarItem".equals(action)) {
			String del = request.getParameter("delindex");
			int d = (new Integer(del)).intValue();
			jspPage = "jsp/Cotizacion/AprobarCotizacion.jsp";

		} else if ("AprobarItem".equals(action)) {
			boolean existe = false;
			String roda = ((String) request.getParameter("listado"));
//			if (itemsElegidos == null) {
//				itemsElegidos = new ArrayList<String>();
//				itemsElegidos.add(roda);
//			} else {
//				for (int i = 0; i < itemsElegidos.size(); i++) {
//					String r = (String) itemsElegidos.get(i);
//					if (r.equals(roda))
//						existe = true;
//				}
//				if (!existe)
//					itemsElegidos.add(roda);
//			}
//			session.setAttribute("itemsElegidos", itemsElegidos);
			jspPage = "jsp/Cotizacion/AprobarCotizacion.jsp";
		}
		dispatch(jspPage, request, response);
	}

	private void cerrar() {
		if (session != null) {
			session.invalidate();
		}
	}

	private void popularCombos(HttpServletRequest request) {
		List<RodamientoVO> rodamientos = new ArrayList<RodamientoVO>();
		rodamientos = AdministradorCotizacion.getInstancia().getRodamientos();
		request.setAttribute("rodamientos", rodamientos);
	}

	protected void dispatch(String jsp, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
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

}
