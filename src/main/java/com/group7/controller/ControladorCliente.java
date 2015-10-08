package com.group7.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group7.business.ClienteVO;
import com.group7.business.OficinaVentasVO;
import com.group7.service.AdministradorCliente;

public class ControladorCliente extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String jspPage = "/index.html";

		if (request.getParameter("cancelar4") != null) {
			action = "default";
		}

		if ((action == null) || (action.length() < 1)) {
			action = "default";
		}

		if ("default".equals(action)) {
			jspPage = "/index.html";
		} else if ("showAlta".equals(action)) {
			List<OficinaVentasVO> oficinas = new ArrayList<OficinaVentasVO>();
			oficinas = AdministradorCliente.getInstancia().getOficinas();
			request.setAttribute("oficinas", oficinas);
			jspPage = "jsp/Cliente/Alta.jsp";
		} else if ("altaCliente".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listadoOficinas"));
			Integer cuil = Integer.valueOf(request.getParameter("CUILCliente"));
			String razonSocial = request.getParameter("razonSocial");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			OficinaVentasVO of = AdministradorCliente.getInstancia().getOficina(nro);
			boolean bandera = AdministradorCliente.getInstancia().alta(cuil, razonSocial, direccion, telefono, of);
			request.setAttribute("bandera", bandera);
			jspPage = "jsp/Generales/Resultado.jsp";

		} else if ("displaylist".equals(action)) {
			List<ClienteVO> clientes = new ArrayList<ClienteVO>();
			clientes = AdministradorCliente.getInstancia().getClientes();
			request.setAttribute("clientes", clientes);
			jspPage = "jsp/Cliente/MostrarLista.jsp";

		} else if ("display".equals(action)) {
			Integer id = Integer.valueOf(request.getParameter("id"));
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(id);
			request.setAttribute("cliente", c);
			jspPage = "jsp/Cliente/Mostrar.jsp";
		} else if ("edit".equals(action)) {
			Integer id = Integer.valueOf(request.getParameter("id"));
			String razonSocial = request.getParameter("razonSocial");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			ClienteVO c = new ClienteVO();
			c.setCUILCliente(id);
			c.setRazonSocial(razonSocial);
			c.setDireccion(direccion);
			c.setTelefono(telefono);
			c.setEstado(true);
			request.setAttribute("cliente", c);
			jspPage = "jsp/Cliente/Editar.jsp";
		} else if ("baja".equals(action)) {
			Integer id = Integer.valueOf(request.getParameter("id"));
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(id);
			if (c != null) {
				AdministradorCliente.getInstancia().baja(c);
			}
		} else if ("save".equals(action)) {
			Integer id = Integer.valueOf(request.getParameter("id"));
			String razonSocial = request.getParameter("razonSocial");
			String telefono = request.getParameter("telefono");
			String direccion = request.getParameter("direccion");
			ClienteVO c = new ClienteVO();
			c.setCUILCliente(id);
			c.setRazonSocial(razonSocial);
			c.setDireccion(direccion);
			c.setTelefono(telefono);
			AdministradorCliente.getInstancia().actualizar(c);
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
