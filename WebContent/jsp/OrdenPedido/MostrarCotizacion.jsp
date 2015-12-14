<%@page import="com.group7.business.CotizacionVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
	<body>
	<%
	CotizacionVO c = (CotizacionVO)request.getAttribute("coti");
	String items = "";
	for (int i=0;i<c.getItems().size();i++){
		if (c.getItems().get(i).getEstado().equals("Aprobado"))
			items = items + c.getItems().get(i).getRodamiento().getDescripcion() +"\t $" + c.getItems().get(i).getPrecio() + "\n";
	}
	%>
	<table>
		<tr>
			<td><b>Numero cotizacion</b></td>
			<td><%=c.getNroCotizacion()%></td>
		</tr>
		<tr>
			<td><b>Fecha</b></td>
			<td><%=c.getFecha()%></td>
		</tr>
		<tr>
			<td><b>dias validez</b></td>
			<td><%=c.getDiasValidez()%></td>
		</tr>
		<tr>
			<td><b>Cliente</b></td>
			<td><%="CUIL: " + c.getCliente().getCuilCliente()+ "- R.Social: " +c.getCliente().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Vinculado a la solicitud de cotizacion</b></td>
			<td><%=c.getNroSolicitudCotizacion()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
<%@ include file="../../footer.html"%>