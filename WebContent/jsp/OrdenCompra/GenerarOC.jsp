<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.group7.business.OrdenPedidoVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar orden de compra</title>
</head>
<body>
<form name="form1" action="./ControladorOrdenCompras" method="POST">
<fieldset>
<legend>Seleccione la Orden de Pedido</legend>
	<select name="listado">
	<%
		OrdenPedidoVO aux;
		List<OrdenPedidoVO> ordenesPedidos;
		ordenesPedidos= (List<OrdenPedidoVO>)request.getAttribute("ordenesPedidos");
		for(Iterator<OrdenPedidoVO> op =ordenesPedidos.iterator(); op.hasNext();)
		{
			
			aux = op.next();
	%>
		<option value="<%=aux.getNroOrdenPedido()%>"><%=aux.getNroOrdenPedido() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getCliente().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="show" value="Mostrar orden de pedido"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarOrdenDeCompra">
	 <input type="submit" name="Submit" value="efectuar Orden De Compra">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
<br>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>