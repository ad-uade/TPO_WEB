package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group7.business.CotizacionVO;

import manager.AdministradorOrdenPedidos;

public class ControladorOrdenPedidos extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String jspPage = "/index.jsp";

		if (request.getParameter("cancelar4") != null) {
			action = "default";
		}

		else if (request.getParameter("show") != null) {
			action = "show";
		}

		if ((action == null) || (action.length() < 1)) {
			action = "default";
		}

		if ("default".equals(action)) {
			jspPage = "/index.jsp";
		} else if ("displayOrdenPedido".equals(action)) {
			List<CotizacionVO> cotizaciones = new ArrayList<CotizacionVO>();
			cotizaciones = AdministradorOrdenPedidos.getInstancia().getCotizaciones();
			request.setAttribute("cotizaciones", cotizaciones);
			jspPage = "jsp/OrdenPedido/GenerarOP.jsp";
		} else if ("efectuarOrdenDePedido".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			CotizacionVO c = AdministradorOrdenPedidos.getInstancia().getCotizacion(nro);
			AdministradorOrdenPedidos.getInstancia().generarOrdenDePedido(c);
		} else if ("show".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			CotizacionVO c = AdministradorOrdenPedidos.getInstancia().getCotizacion(nro);
			request.setAttribute("coti", c);
			jspPage = "jsp/OrdenPedido/MostrarCotizacion.jsp";
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

}
