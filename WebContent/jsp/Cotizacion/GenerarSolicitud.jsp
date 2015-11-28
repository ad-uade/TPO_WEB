<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.group7.business.CondicionVentaVO"%>
<%@ page session="true" %>
<%@page import="com.group7.business.RodamientoVO"%>
<%@page import="com.group7.business.ClienteVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar Solicitud Cotizacion</title>
	
<script type="text/javascript">
function validar(){
	if(document.form1.cantidad.value==''){
		alert('El campo cantidad esta vacio');
		document.form1.cantidad.focus();
		return false;
	}
	if(document.form1.clienteid.value==''){
		alert('El campo clienteid esta vacio');
		document.form1.clienteid.focus();
		return false;
	}
}

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
<% 

String cliente="";
String cuit ="";
if( session.getAttribute("clienteSeleccionado")!=null)
{
	ClienteVO c = (ClienteVO) session.getAttribute("clienteSeleccionado");
	
	cliente =c.getRazonSocial();
	cuit =  String.valueOf( c.getCuilCliente());
}
	
%>

<br>

<form name="form1" action="./ControladorCotizacion" method="POST"  onsubmit="return validar();">
<fieldset>
<legend>Cabecera Solicitud Cotizacion</legend>
	<table>
		<tr><td>CUIL:</td><td><input type="text" onkeypress="return soloNumeros(event)" name="clienteid" value=<%=cuit%>></td>
		<td><input type="submit" name="validarCliente" value="validar Cliente"></td> 
		</tr>
		<tr><td><%=cliente%></td>
		<td><%=cuit %></td></tr>
	</table>
</fieldset>
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
	<select name="listadoC">
	<%
		CondicionVentaVO aux1;
		List<CondicionVentaVO> condiciones;
		condiciones= (List<CondicionVentaVO>)request.getAttribute("condiciones");
		
		
		if(condiciones!=null)
		{
		
		for(Iterator<CondicionVentaVO> c1 =condiciones.iterator();c1.hasNext();)
		{
			
			aux1 = c1.next();
	
	
	%>
		<option value="<%=aux1.getNroCondicion()%>"><%=aux1.getNroCondicion() + " Fecha desde:" + aux1.getFechaDesde() + " Fecha hasta:" + aux1.getFechaHasta()%></option>
	<%
		}}
	%>
	</select>
	Cantidad:<input type="text" name="cantidad" SIZE="3" value=1 onkeypress="return soloNumeros(event)">
	 <input type="hidden" name="action" value="add">
	 <input type="submit" name="Submit" value="Agregar item"><br>
</fieldset>
</form>	
<jsp:include page="Carrito.jsp" flush="true" />
<br>
<form name="form2" action="./ControladorCotizacion" method="POST">

 <input type="hidden" name="action" value="save">
 <input type="submit" name="f2Confirmar" value="Confirmar solicitud" >
 <input type="submit" name="f2Cancelar" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
 </form>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>
