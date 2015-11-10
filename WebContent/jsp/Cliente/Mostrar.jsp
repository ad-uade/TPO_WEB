<%@page import="java.util.*"%>
<%@page import="NegocioVO.ClienteVO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mostrar Cliente</title>
	</head>
	<body>
	<%
	ClienteVO c = (ClienteVO)request.getAttribute("cliente");
	%>
	<table>
		<tr>
			<td><b>Cliente:</b> 
			</td>
		</tr>
		<tr>
			<td><b>CUIL Cliente</b></td>
			<td><%=c.getCUILCliente()%></td>
		</tr>
		<tr>
			<td><b>Razon Social</b></td>
			<td><%=c.getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Direccion</b></td>
			<td><%=c.getDireccion()%></td>
		</tr>
		<tr>
			<td><b>Telefono</b></td>
			<td><%=c.getTelefono()%></td>
		</tr>
		<tr>
			<td><b>Estado</b></td>
			<td><%=c.isEstado()%></td>
		</tr>

		<tr>
			<td>
			   <a href="ControladorCliente?action=edit&id=<%=c.getCUILCliente()%>&razonSocial=<%=c.getRazonSocial()%>&direccion=<%=c.getDireccion()%>&telefono=<%=c.getTelefono()%>">Editar Cliente</a>
			</td>
		</tr>
		
		<tr>
			<td>
			   <a href="ControladorCliente?action=baja&id=<%=c.getCUILCliente()%>">Dar de baja Cliente</a>
			</td>
		</tr>
		</table>
	</body>
</html>