<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="NegocioVO.RemitoExteriorVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar Factura</title>
</head>
<body>
<form name="form1" action="./ControladorFacturas" method="POST">
<fieldset>
<legend>Seleccione el remito</legend>
	<select name="listado">
	<%
	RemitoExteriorVO aux;
		List<RemitoExteriorVO> remitos;
		remitos= (List<RemitoExteriorVO>)request.getAttribute("remitos");
		for(Iterator<RemitoExteriorVO> c =remitos.iterator(); c.hasNext();)
		{
			
			aux = c.next();
	%>
		<option value="<%=aux.getNroRemito()%>"><%=aux.getNroRemito() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getCliente().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="show" value="Mostrar el remito"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarFactura">
	 <input type="submit" name="Submit" value="efectuar Factura">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
<br>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>