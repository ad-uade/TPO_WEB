<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.group7.business.ProveedorVO"%>
<%@ page import= "java.util.*"%>

<html>
<head>
	<title>Lista de Proveedores</title>
</head>
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
	proveedores = (List<ProveedorVO>)request.getAttribute("proveedores");
	for(Iterator<ProveedorVO> p =proveedores.iterator(); p.hasNext();)
	{
		aux = p.next();
%>
	<tr>
		<td>
		<a href="ControladorProveedor?action=display&id=<%=aux.getCUILProveedor()%>"><%=aux.getCUILProveedor()%></a>
		</td>
 		<td><%=aux.getRazonSocial()%></td>
 		<td><%=aux.getDireccion()%></td>
		<td><%=aux.getTelefono()%></td>
		<td><%=aux.isEstado()%></td>

	</tr>
<% } %>
</table>
</body>
<a href="index.html" target="_self">Volver al index</a>
</html>