<%@page import="com.group7.business.OrdenCompraVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			<td><%="CUIL: " + op.getProveedor().getCuilProveedor()+ "- R.Social: " +op.getProveedor().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>