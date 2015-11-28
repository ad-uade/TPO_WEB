<%@page import="com.group7.business.RemitoExteriorVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
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
			<td><%="CUIL: " + r.getCliente().getCuilCliente()+ "- R.Social: " +r.getCliente().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
<%@ include file="../../footer.html"%>