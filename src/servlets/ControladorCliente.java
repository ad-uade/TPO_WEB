package servlets;

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

import manager.AdministradorCliente;

public class ControladorCliente extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String jspPage = "/index.jsp";

		if (request.getParameter("cancelar4") != null) {
			action = "default";
		}

		if ((action == null) || (action.length() < 1)) {
			action = "default";
		}

		if ("default".equals(action)) {
			jspPage = "/index.jsp";
		} else if ("showAlta".equals(action)) {
			request.setAttribute("oficinas", AdministradorCliente.getInstancia().getOficinas());
			jspPage = "jsp/Cliente/Alta.jsp";
		} else if ("altaCliente".equals(action)) {
			Integer nro = Integer.valueOf(request.getParameter("listadoOficinas"));
			Long cuil = Long.valueOf(request.getParameter("CuilCliente"));
			String razonSocial = request.getParameter("razonSocial");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			ClienteVO clienteVO = new ClienteVO();
			clienteVO.setCuilCliente(cuil);
			clienteVO.setDireccion(direccion);
			clienteVO.setTelefono(telefono);
			clienteVO.setRazonSocial(razonSocial);
			OficinaVentasVO of = AdministradorCliente.getInstancia().getOficina(nro);
			clienteVO.setODV(of);
			AdministradorCliente.getInstancia().alta(clienteVO);
			request.setAttribute("bandera", true);
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(cuil);
			request.setAttribute("cliente", c);
			jspPage = "jsp/Cliente/Mostrar.jsp";

		} else if ("displaylist".equals(action)) {
			List<ClienteVO> clientes = new ArrayList<ClienteVO>();
			clientes = AdministradorCliente.getInstancia().getClientes();
			request.setAttribute("clientes", clientes);
			jspPage = "jsp/Cliente/MostrarLista.jsp";

		} else if ("display".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(id);
			request.setAttribute("cliente", c);
			jspPage = "jsp/Cliente/Mostrar.jsp";
		} else if ("edit".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(id);
			request.setAttribute("cliente", c);
			String razonSocial = request.getParameter("razonSocial");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			ClienteVO cliente = new ClienteVO();
			cliente.setCuilCliente(id);
			cliente.setRazonSocial(razonSocial);
			cliente.setDireccion(direccion);
			cliente.setTelefono(telefono);
			cliente.setEstado(true);
			request.setAttribute("cliente", c);
			jspPage = "jsp/Cliente/Editar.jsp";
		} else if ("baja".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(id);
			if (c != null) {
				AdministradorCliente.getInstancia().baja(c);
				
			}
			List<ClienteVO> clientes = new ArrayList<ClienteVO>();
			clientes = AdministradorCliente.getInstancia().getClientes();
			request.setAttribute("clientes", clientes);
			jspPage = "jsp/Cliente/MostrarLista.jsp";
		} else if ("save".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			ClienteVO c = AdministradorCliente.getInstancia().getCliente(id);
			String razonSocial = request.getParameter("razonSocial");
			String telefono = request.getParameter("telefono");
			String direccion = request.getParameter("direccion");
			c.setRazonSocial(razonSocial);
			c.setDireccion(direccion);
			c.setTelefono(telefono);
			AdministradorCliente.getInstancia().actualizar(c);
			request.setAttribute("cliente", c);
			jspPage = "jsp/Cliente/Editar.jsp";
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		System.out.println(request.toString());
		doPost(request, response);
	}
}
