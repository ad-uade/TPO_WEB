<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro Cliente</title>
</head>
	<jsp:useBean id="registroCliente" class="beans.Cliente" />
	<jsp:setProperty name="registroCliente"
    				 property="razonSocial"
	    			 param="razonSocial" />
	<jsp:setProperty name="registroCliente"
    				 property="CUILCliente"
	    			 param="CUILCliente" />
	<jsp:setProperty name="registroCliente"
    				 property="direccion"
	    			 param="direccion" />
	<jsp:setProperty name="registroCliente"
    				 property="telefono"
	    			 param="telefono" />

<body>

<h2 align="center">Datos del Registro de Cliente</h2>
<table align="center" border="1" cellpadding="3" cellspacing="2">
	<tr align="left" bgcolor="#faf9f8">
		<td>Razon Social:</td>
		<td><jsp:getProperty name="registroCliente" property="razonSocial" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">	
		<td>CUIL:</td>
		<td><jsp:getProperty name="registroCliente" property="CUILCliente" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">
		<td>Direccion:</td>
		<td><jsp:getProperty name="registroCliente" property="direccion" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">	
		<td>Telefono:</td>
		<td><jsp:getProperty name="registroCliente" property="telefono" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">	
		<td><a href="/TPO_ClienteWEB/ControladorCliente?action=alta&id=<%=request.getParameter("CUILCliente")%>&razonSocial=<%=request.getParameter("razonSocial")%>&direccion=<%=request.getParameter("direccion")%>&telefono=<%=request.getParameter("telefono")%>">Confirmar Cliente</a></td>
		<td></td>
	</tr>
</table>

</body>
</html>
