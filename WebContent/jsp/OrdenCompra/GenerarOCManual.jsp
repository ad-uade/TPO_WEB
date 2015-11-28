<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true" %>
<%@page import="com.group7.business.RodamientoVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar orden de compra manual</title>
<script type="text/javascript">
function soloNumeros(evt){
	if(window.event){
		keynum = evt.keyCode;
	}else{
		keynum = evt.which;
	}
	if(keynum>47 && keynum<58){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<form name="form1" action="./ControladorOrdenCompras" method="POST">
<fieldset>
	<legend>Seleccione los items que lo van a componer</legend>
	Rodamientos:
	<select name="listado">
	<%
		RodamientoVO aux;
		List<RodamientoVO> rodamientos;
		rodamientos= (List<RodamientoVO>)request.getAttribute("rodamientos");
		
		
		if(rodamientos!=null)
		{
		
		for(Iterator<RodamientoVO> r =rodamientos.iterator(); r.hasNext();)
		{
			
			aux = r.next();
			String clave = aux.getCodigoSFK() +"/"+ aux.getCodigoPieza();
	
	
	%>
		<option value="<%=clave%>"><%=aux.getDescripcion()%></option>
	<%
		}}
	%>
	</select>
	Cantidad:<input type="text" name="cantidad" SIZE="3" value=1  onkeypress="return soloNumeros(event)">
	 <input type="hidden" name="action" value="add">
	 <input type="submit" name="Submit" value="Agregar item"><br>
</fieldset>
</form>	
<jsp:include page="Carrito.jsp" flush="true" />
<br>
<form name="form2" action="./ControladorOrdenCompras" method="POST">

 <input type="hidden" name="action" value="save">
 <input type="submit" name="f2Confirmar" value="Confirmar Orden de Compra" >
 <input type="submit" name="f2Cancelar" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
 </form>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>