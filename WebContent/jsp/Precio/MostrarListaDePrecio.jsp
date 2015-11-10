<%@page import="NegocioVO.ListaPreciosVO"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Mostrar Lista de precio</title>
	</head>
	<body>
	<%
	ListaPreciosVO lp = (ListaPreciosVO)request.getAttribute("lp");
	String items = "";
	for (int i=0;i<lp.getItems().size();i++){
		items = items + lp.getItems().get(i).getRodamiento().getDescripcion() +"\t $" + lp.getItems().get(i).getPrecioVenta() + "\n";
	}
	%>
	<table>
		<tr>
			<td><b>Numero Lista</b></td>
			<td><%=lp.getNroLista()%></td>
		</tr>
		<tr>
			<td><b>Fecha de publicacion</b></td>
			<td><%=lp.getFechaPublicacion()%></td>
		</tr>
		<tr>
			<td><b>Proveedor</b></td>
			<td><%="CUIL: " + lp.getProveedor().getCUILProveedor()+ "- R.Social: " +lp.getProveedor().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
		</table>
	</body>
</html>