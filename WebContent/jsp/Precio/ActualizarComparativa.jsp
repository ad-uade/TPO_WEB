<%@page import="com.group7.business.ListaPreciosVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<body>
<form name="form4" action="./ControladorPrecios" method="post">
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
</body>
<%@ include file="../../footer.html"%>