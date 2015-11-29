<%@ include file="../../header.html"%>

<%@page import="com.group7.business.ProveedorVO"%>
<%@ page import="java.util.*"%>

<body>

	<table>
		<tr>
			<td><b>Lista de Proveedores</b></td>
		</tr>
		<tr>
			<td><b>CUIL Proveedores</b></td>
			<td><b>Razon Social</b></td>
			<td><b>Direccion</b></td>
			<td><b>Telefono</b></td>
			<td><b>Estado</b></td>
		</tr>
		<%
			ProveedorVO aux;
			List<ProveedorVO> proveedores;
			proveedores = (List<ProveedorVO>) request.getAttribute("proveedores");
			for (Iterator<ProveedorVO> p = proveedores.iterator(); p.hasNext();) {
				aux = p.next();
		%>
		<tr>
			<td><a
				href="ControladorProveedor?action=display&id=<%=aux.getCuilProveedor()%>"><%=aux.getCuilProveedor()%></a>
			</td>
			<td><%=aux.getRazonSocial()%></td>
			<td><%=aux.getDireccion()%></td>
			<td><%=aux.getTelefono()%></td>
			<td><%=aux.isEstado()%></td>

		</tr>
		<%
			}
		%>
	</table>
</body>
<%@ include file="../../footer.html"%>