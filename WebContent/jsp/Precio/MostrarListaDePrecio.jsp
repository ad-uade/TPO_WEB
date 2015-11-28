<%@page import="com.group7.business.ListaPreciosVO"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<body>
	<%
		ListaPreciosVO lp = (ListaPreciosVO) request.getAttribute("lp");
		String items = "";
		for (int i = 0; i < lp.getItems().size(); i++) {
			items = items + lp.getItems().get(i).getRodamiento().getDescripcion() + "\t $"
					+ lp.getItems().get(i).getPrecioVenta() + "\n";
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
			<td><%="CUIL: " + lp.getProveedor().getCUILProveedor() + "- R.Social: "
					+ lp.getProveedor().getRazonSocial()%></td>
		</tr>
		<tr>
			<td><b>Items</b></td>
			<td><%=items%></td>
		</tr>
	</table>
</body>
