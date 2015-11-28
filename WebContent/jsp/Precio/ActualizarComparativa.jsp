<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.group7.business.ListaPreciosVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Actualizar comparativa de precios</title>
</head>
<body>
<form name="form4" action="./ControladorPrecios" method="POST">
<fieldset>
<legend>Seleccione la lista de precio</legend>
	<select name="listado">
	<%
		ListaPreciosVO aux;
		List<ListaPreciosVO> listas;
		listas= (List<ListaPreciosVO>)request.getAttribute("listas");
		for(Iterator<ListaPreciosVO> l =listas.iterator(); l.hasNext();)
		{
			
			aux = l.next();
	%>
		<option value="<%=aux.getNroLista()%>"><%=aux.getNroLista() + " F.Publicacion:" + aux.getFechaPublicacion() + " Proveedor:" + aux.getProveedor().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="show" value="Mostrar detalle lista de precio"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarComparativa">
	 <input type="submit" name="Submit" value="Efectuar Comparativa">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
<br>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>