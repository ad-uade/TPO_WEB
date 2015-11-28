<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.group7.business.OrdenCompraVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar Recepcion de Mercaderia</title>
</head>
<body>
<form name="form1" action="./ControladorOrdenCompras" method="POST">
<fieldset>
<legend>Seleccione la Orden de Compra</legend>
	<select name="listado">
	<%
		OrdenCompraVO aux;
		List<OrdenCompraVO> ordenesCompras;
		ordenesCompras= (List<OrdenCompraVO>)request.getAttribute("ordenesCompras");
		for(Iterator<OrdenCompraVO> oc =ordenesCompras.iterator(); oc.hasNext();)
		{
			
			aux = oc.next();
	%>
		<option value="<%=aux.getNroOrdenCompra()%>"><%=aux.getNroOrdenCompra() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getProveedor().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="showOC" value="Mostrar orden de compra"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarRecepcion">
	 <input type="submit" name="Submit" value="efectuar recepcion">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
<br>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>