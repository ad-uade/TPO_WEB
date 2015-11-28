<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.group7.business.ProveedorVO"%>
<%@page import="com.group7.business.RodamientoVO"%>
<%@ page session="true" %>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar Lista de precios</title>
	
<script type="text/javascript">
function validar(){
	if(document.form.precioVenta.value==''){
		alert('El campo precioVenta esta vacio');
		document.form.precioVenta.focus();
		return false;
	}
	if(document.form.proveedorid.value==''){
		alert('El campo proveedorid esta vacio');
		document.form.proveedorid.focus();
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

function soloNumerosYPunto(evt){
	if(window.event){
		keynum = evt.keyCode;
	}else{
		keynum = evt.which;
	}
	if(keynum>45 && keynum<58){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<% 

String proveedor="";
String cuit ="";
String tipo = "";
String descuento = "";
String vigencia = "";

if( session.getAttribute("proveedorSeleccionado")!=null)
{
	ProveedorVO p = (ProveedorVO) session.getAttribute("proveedorSeleccionado");
	
	proveedor =p.getRazonSocial();
	cuit =  String.valueOf( p.getCUILProveedor());
}

if (session.getAttribute("tipo")!=null)
	tipo = (String) session.getAttribute("tipo");
if (session.getAttribute("descuento")!=null)
	descuento = (String) session.getAttribute("descuento");
if (session.getAttribute("vigencia")!=null)
	vigencia = (String) session.getAttribute("vigencia");

	
%>
<form name="form" action="./ControladorPrecios" method="POST"   onsubmit="return validar();">
<fieldset>
<legend>Cabecera Lista de precios</legend>
<table>
	<tr>
		<td>CUIL:</td><td><input type="text" onkeypress="return soloNumeros(event)" name="proveedorid" value=<%=cuit%>>La razon social es: <%=proveedor%></td>
		<td><input type="submit" name="validarProveedor" value="validar proveedor"></td>
	</tr>
	<tr>
		<td>Tipo:</td><td><input type="text" name="tipo" value=<%=tipo%>></td>
	</tr>
	<tr>
		<td>Vigencia (cantidad de dias):</td><td><input type="text" onkeypress="return soloNumeros(event)" name="vigencia" value=<%=vigencia %>></td>
	</tr>
	<tr>
		<td>Descuento:</td><td><input type="text" name="descuento" onkeypress="return soloNumerosYPunto(event)" value=<%=descuento %>></td>
	</tr>
</table>
</fieldset>
<fieldset>
<legend>Cuerpo Lista de precios</legend>
	<legend>Seleccione los items que lo van a componer</legend>
	Rodamientos:
	<select name="listadoRodamientos">
	<%
		RodamientoVO aux1;
		List<RodamientoVO> rodamientos;
		rodamientos= (List<RodamientoVO>)request.getAttribute("rodamientos");
		
		
		if(rodamientos!=null)
		{
		
		for(Iterator<RodamientoVO> r =rodamientos.iterator(); r.hasNext();)
		{
			
			aux1 = r.next();
			String clave = aux1.getCodigoSFK() +"/"+ aux1.getCodigoPieza();
	
	
	%>
		<option value="<%=clave%>"><%=aux1.getDescripcion()%></option>
	<%
		}}
	%>
	</select>
	Precio de venta:<input type="text" name="precioVenta" SIZE="3" value=1 onkeypress="return soloNumerosYPunto(event)">
	 <input type="hidden" name="action" value="add">
	 <input type="submit" name="agregarItem" value="Agregar item"><br>
</fieldset>
</form>
<jsp:include page="lista.jsp" flush="true" />
<br>
<form name="form1" action="./ControladorPrecios" method="POST">
 <input type="hidden" name="action" value="save">
 <input type="submit" name="save" value="Generar lista de precios" >
 <input type="submit" name="cancelar" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</form>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>
