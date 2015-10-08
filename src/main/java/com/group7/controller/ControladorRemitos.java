package com.group7.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group7.business.OrdenPedidoVO;
import com.group7.business.RemitoExteriorVO;
import com.group7.service.AdministradorFacturas;
import com.group7.service.AdministradorRemitos;

public class ControladorRemitos extends HttpServlet {

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
		} else if ("displayRemito".equals(action)) {
			List<OrdenPedidoVO> ordenes = new ArrayList<OrdenPedidoVO>();
			ordenes = AdministradorRemitos.getInstancia().getOrdenesPedidos();
			request.setAttribute("ordenesPedidos", ordenes);
			jspPage = "jsp/Remito/GenerarRemito.jsp";
		} else if ("efectuarRemito".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			OrdenPedidoVO op = AdministradorRemitos.getInstancia().getOrdenPedido(nro);
			boolean bandera = AdministradorRemitos.getInstancia().generarRemito(op);
			request.setAttribute("bandera", bandera);
			jspPage = "jsp/Generales/Resultado.jsp";
		} else if ("show".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			OrdenPedidoVO op = AdministradorRemitos.getInstancia().getOrdenPedido(nro);
			request.setAttribute("ordenPedido", op);
			jspPage = "jsp/Remito/MostrarOP.jsp";
		} else if ("displayConformidad".equals(action)) {
			List<RemitoExteriorVO> remitos = new ArrayList<RemitoExteriorVO>();
			remitos = AdministradorFacturas.getInstancia().getRemitosNoConformados();
			request.setAttribute("remitos", remitos);
			jspPage = "jsp/Remito/ConformidadCliente.jsp";
		} else if ("efectuarConformidad".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listado"));
			AdministradorFacturas.getInstancia().efectuarConformidad(nro);
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
