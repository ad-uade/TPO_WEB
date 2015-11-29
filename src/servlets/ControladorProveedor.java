package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.group7.business.ProveedorVO;

import manager.AdministradorProveedor;

public class ControladorProveedor extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String jspPage = "/index.html";

		if ((action == null) || (action.length() < 1)) {
			action = "default";
		}

		if ("default".equals(action)) {
			jspPage = "/index.html";
		} else if ("displaylist".equals(action)) {
			List<ProveedorVO> proveedores = new ArrayList<ProveedorVO>();
			proveedores = AdministradorProveedor.getInstancia().getProveedores();
			request.setAttribute("proveedores", proveedores);
			jspPage = "jsp/Proveedor/MostrarLista.jsp";

		} else if ("display".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			ProveedorVO c = AdministradorProveedor.getInstancia().getProveedor(id);
			request.setAttribute("proveedor", c);
			jspPage = "jsp/Proveedor/Mostrar.jsp";
		} else if ("edit".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			String razonSocial = request.getParameter("razonSocial");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			ProveedorVO p = new ProveedorVO();
			p.setCuilProveedor(id);
			p.setRazonSocial(razonSocial);
			p.setDireccion(direccion);
			p.setTelefono(telefono);
			p.setEstado(true);
			request.setAttribute("proveedor", p);
			jspPage = "jsp/Proveedor/Editar.jsp";
		} else if ("baja".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			ProveedorVO p = AdministradorProveedor.getInstancia().getProveedor(id);
			if (p != null) {
				AdministradorProveedor.getInstancia().baja(p);
			}
		} else if ("alta".equals(action)) {
			Long cuil = Long.valueOf(request.getParameter("id"));
			String razonSocial = request.getParameter("razonSocial");
			String direccion = request.getParameter("direccion");
			String telefono = request.getParameter("telefono");
			boolean bandera = AdministradorProveedor.getInstancia().alta(cuil, razonSocial, direccion, telefono);
			request.setAttribute("bandera", bandera);
			jspPage = "jsp/Generales/Resultado.jsp";
		} else if ("save".equals(action)) {
			Long id = Long.valueOf(request.getParameter("id"));
			String razonSocial = request.getParameter("razonSocial");
			String telefono = request.getParameter("telefono");
			String direccion = request.getParameter("direccion");
			ProveedorVO c = new ProveedorVO();
			c.setCuilProveedor(id);
			c.setRazonSocial(razonSocial);
			c.setDireccion(direccion);
			c.setTelefono(telefono);
			AdministradorProveedor.getInstancia().actualizar(c);
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
