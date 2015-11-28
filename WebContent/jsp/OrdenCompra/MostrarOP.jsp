<%@page import="com.group7.business.OrdenPedidoVO"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<body>
	<%
	OrdenPedidoVO op = (OrdenPedidoVO)request.getAttribute("orden");
	String items = "";
	for (int i=0;i<op.getItems().size();i++){
		items = items + op.getItems().get(i).getRodamiento().getDescripcion() +"\t x" + op.getItems().get(i).getCantidad() + "\n";
	}
	%>
	<table>
		<tr>
			<td><b>Numero de orden de pedido</b></td>
			<td><%=op.getNroOrdenPedido()%></td>
		</tr>
		<tr>
			<td><b>Fecha</b></td>
			<td><%=op.getFecha()%></td>
		</tr>
		<tr>
			<td><b>Vinculado a la cotizacion</b></td>
			<td><%=op.getCotizacion().getNroCotizacion()%></td>
		</tr>
		<tr>
			<td><b>Cliente</b></td>
			<td><%="CUIL: " + op.getCliente().getCuilCliente()+ "- R.Social: " +op.getCliente().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
<%@ include file="../../footer.html"%>