<%@page import="NegocioVO.OrdenCompraVO"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mostrar detalle Orden de compra</title>
	</head>
	<body>
	<%
	OrdenCompraVO op = (OrdenCompraVO)request.getAttribute("orden");
	String items = "";
	for (int i=0;i<op.getItems().size();i++){
		items = items + op.getItems().get(i).getRodamiento().getDescripcion() +"\t x" + op.getItems().get(i).getCantidad() + "\n";
	}
	%>
	<table>
		<tr>
			<td><b>Numero de orden de compra</b></td>
			<td><%=op.getNroOrdenCompra()%></td>
		</tr>
		<tr>
			<td><b>Fecha</b></td>
			<td><%=op.getFecha()%></td>
		</tr>
		<tr>
			<td><b>Proveedor</b></td>
			<td><%="CUIL: " + op.getProveedor().getCUILProveedor()+ "- R.Social: " +op.getProveedor().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
</html>