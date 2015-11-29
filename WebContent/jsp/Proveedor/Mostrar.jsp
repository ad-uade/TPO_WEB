<%@page import="java.util.*"%>
<%@page import="com.group7.business.ProveedorVO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
	<body>
	<%
	ProveedorVO p = (ProveedorVO)request.getAttribute("proveedor");
	%>
	<table>
		<tr>
			<td><b>Proveedor:</b> 
			</td>
		</tr>
		<tr>
			<td><b>CUIL Proveedor</b></td>
			<td><%=p.getCuilProveedor()%></td>
		</tr>
		<tr>
			<td><b>Razon Social</b></td>
			<td><%=p.getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Direccion</b></td>
			<td><%=p.getDireccion()%></td>
		</tr>
		<tr>
			<td><b>Telefono</b></td>
			<td><%=p.getTelefono()%></td>
		</tr>
		<tr>
			<td><b>Estado</b></td>
			<td><%=p.isEstado()%></td>
		</tr>

		<tr>
			<td>
			   <a href="ControladorProveedor?action=edit&id=<%=p.getCuilProveedor()%>&razonSocial=<%=p.getRazonSocial()%>&direccion=<%=p.getDireccion()%>&telefono=<%=p.getTelefono()%>">Editar Proveedor</a>
			</td>
		</tr>
		
		<tr>
			<td>
			   <a href="ControladorProveedor?action=baja&id=<%=p.getCuilProveedor()%>">Dar de baja Proveedor</a>
			</td>
		</tr>
		</table>
	</body>
<%@ include file="../../footer.html"%>