<%@page import="java.util.*"%>
<%@page import="com.group7.business.SolicitudCotizacionVO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mostrar SolicitudCotizacion</title>
	</head>
	<body>
	<%
	SolicitudCotizacionVO c = (SolicitudCotizacionVO)request.getAttribute("sc");
	String items = "";
	for (int i=0;i<c.getItems().size();i++){
		items = items + c.getItems().get(i).getRodamiento().getDescripcion() +"\tx" + c.getItems().get(i).getCantidad() + " (CV nro: " + c.getItems().get(i).getCondicion().getNroCondicion() +  ")\n";
	}
	%>
	<table>
		<tr>
			<td><b>Numero</b></td>
			<td><%=c.getNroSolicitudCotizacion()%></td>
		</tr>
		<tr>
			<td><b>Fecha</b></td>
			<td><%=c.getFecha()%></td>
		</tr>
		<tr>
			<td><b>Cliente</b></td>
			<td><%="CUIL: " + c.getCliente().getCuilCliente() + "- R.Social: " +c.getCliente().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
</html>