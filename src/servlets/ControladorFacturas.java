package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group7.business.RemitoExteriorVO;
import com.group7.business.RemitoVO;

import manager.AdministradorFacturas;

public class ControladorFacturas extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String jspPage = "/index.html";

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
			jspPage = "/index.html";
		} else if ("displayFacturas".equals(action)) {
			List<RemitoExteriorVO> remitos = new ArrayList<RemitoExteriorVO>();
			remitos = AdministradorFacturas.getInstancia().getRemitos();
			request.setAttribute("remitos", remitos);
			jspPage = "jsp/Factura/GenerarF.jsp";
		} else if ("efectuarFactura".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			RemitoVO r = AdministradorFacturas.getInstancia().getRemito(nro);
			AdministradorFacturas.getInstancia().generarFactura(r);
		} else if ("show".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			RemitoVO c = AdministradorFacturas.getInstancia().getRemito(nro);
			request.setAttribute("remi", c);
			jspPage = "jsp/Factura/MostrarRemito.jsp";
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
