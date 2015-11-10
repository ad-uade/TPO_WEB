<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="NegocioVO.ClienteVO"%>
<%@ page import= "java.util.*"%>

<html>
<head>
	<title>Lista de Clientes</title>
</head>
<body>

<table>
	<tr>
		<td><b>Lista de Clientes</b></td>
	</tr>
	<tr>
		<td><b>CUIL Cliente</b></td>
		<td><b>Razon Social</b></td>
		<td><b>Direccion</b></td>
		<td><b>Telefono</b></td>
		<td><b>Estado</b></td>
		<td><b>Oficina de Ventas</b></td>
	</tr>
<%
	ClienteVO aux;
	List<ClienteVO> clientes;
	clientes = (List<ClienteVO>)request.getAttribute("clientes");
	for(Iterator<ClienteVO> c =clientes.iterator(); c.hasNext();)
	{
		aux = c.next();
%>
	<tr>
		<td>
		<a href="ControladorCliente?action=display&id=<%=aux.getCUILCliente()%>"><%=aux.getCUILCliente()%></a>
		</td>
 		<td><%=aux.getRazonSocial()%></td>
 		<td><%=aux.getDireccion()%></td>
		<td><%=aux.getTelefono()%></td>
		<td><%=aux.isEstado()%></td>
		<td><%=aux.getODV().getSucursal()%></td>

	</tr>
<% } %>
</table>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>