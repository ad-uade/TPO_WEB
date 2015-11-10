<%@page import="NegocioVO.RemitoExteriorVO"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mostrar detalle de la cotizacion</title>
	</head>
	<body>
	<%
	RemitoExteriorVO r = (RemitoExteriorVO)request.getAttribute("remi");
	String items = "";
	for (int i=0;i<r.getItems().size();i++){
			items = items + r.getItems().get(i).getRodamiento().getDescripcion() +"\t x" + r.getItems().get(i).getCantidad() + "\n";
	}
	%>
	<table>
		<tr>
			<td><b>Numero remito</b></td>
			<td><%=r.getNroRemito()%></td>
		</tr>
		<tr>
			<td><b>Fecha</b></td>
			<td><%=r.getFecha()%></td>
		</tr>
		<tr>
			<td><b>Vinculado a la orden de pedido</b></td>
			<td><%=r.getOrdenPedido().getNroOrdenPedido()%></td>
		</tr>
		<tr>
			<td><b>Cliente</b></td>
			<td><%="CUIL: " + r.getCliente().getCUILCliente()+ "- R.Social: " +r.getCliente().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
</html>