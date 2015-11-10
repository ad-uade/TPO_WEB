<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="NegocioVO.OficinaVentasVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Alta de Cliente</title>
	
<script type="text/javascript">
function validar(){
	if(document.form1.razonSocial.value==''){
		alert('El campo razonSocial esta vacio');
		document.form1.razonSocial.focus();
		return false;
	}
	if(document.form1.CUILCliente.value==''){
		alert('El campo CUILCliente esta vacio');
		document.form1.CUILCliente.focus();
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
<br>

<form name="form1" action="./ControladorCliente" method="POST"  onsubmit="return validar();">
<fieldset>
<legend>Datos de cliente</legend>
<table>
	<tr><td>Razon Social:</td><td><input type="TEXT" name="razonSocial" size=20></td></tr>
	<tr><td>CUIL:</td><td><input type="text" name="CUILCliente" size=11 onkeypress="return soloNumeros(event)"></td></tr>
	<tr><td>Direccion:</td><td><input type="TEXT" name="direccion" size=25></td></tr>
	<tr><td>Telefono:</td><td><input type="TEXT" name="telefono" size=10 onkeypress="return soloNumeros(event)"></td></tr>
	<tr><td>Oficina De Venta:</td><td>
		<select name="listadoOficinas">
	<%
		OficinaVentasVO aux;
		List<OficinaVentasVO> oficinas;
		oficinas= (List<OficinaVentasVO>)request.getAttribute("oficinas");
		
		
		if(oficinas!=null)
		{
		
		for(Iterator<OficinaVentasVO> r =oficinas.iterator(); r.hasNext();)
		{
			
			aux = r.next();
	
	%>
		<option value="<%=aux.getIdOficina()%>"><%=aux.getSucursal()%></option>
	<%
		}}
	%>
		</select>
	</td></tr>
	<tr><td> <input type="hidden" name="action" value="altaCliente">
	<input type="SUBMIT" value=" Dar de alta " ></td></tr>
</table>
</fieldset>
</form>	
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>
