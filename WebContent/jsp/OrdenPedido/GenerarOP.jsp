<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="NegocioVO.CotizacionVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar orden de pedido</title>
</head>
<body>
<form name="form1" action="./ControladorOrdenPedidos" method="POST">
<fieldset>
<legend>Seleccione la cotizacion</legend>
	<select name="listado">
	<%
		CotizacionVO aux;
		List<CotizacionVO> cotizaciones;
		cotizaciones= (List<CotizacionVO>)request.getAttribute("cotizaciones");
		for(Iterator<CotizacionVO> c =cotizaciones.iterator(); c.hasNext();)
		{
			
			aux = c.next();
	%>
		<option value="<%=aux.getNroCotizacion()%>"><%=aux.getNroCotizacion() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getCliente().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="show" value="Mostrar de la cotizacion"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarOrdenDePedido">
	 <input type="submit" name="Submit" value="efectuar Orden De Pedido">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
<br>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>