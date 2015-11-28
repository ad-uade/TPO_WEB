<%@ include file="../../header.html"%>
<%@page import="java.util.*"%>
<%@page import="com.group7.business.ClienteVO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>

<script type="text/javascript">
function validar(){
	if(document.form.razonSocial.value==''){
		alert('El campo razonSocial esta vacio');
		document.form.razonSocial.focus();
		return false;
	}
	if(document.form.direccion.value==''){
		alert('El campo direccion esta vacio');
		document.form.direccion.focus();
		return false;
	}
	if(document.form.telefono.value==''){
		alert('El campo telefono esta vacio');
		document.form.telefono.focus();
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

<body>
	<%
	ClienteVO c = (ClienteVO)request.getAttribute("cliente");
	String successMsg = "";
	if(!String.valueOf(request.getAttribute("successMsg")).equals("") && request.getAttribute("successMsg")!=null){
		successMsg=String.valueOf(request.getAttribute("successMsg"));
	}
	
	%>
	<form name="form" action="ControladorCliente?action=save&id=<%=c.getCuilCliente()%>" method="post" onsubmit="return validar();">
	<table>
	<tr>
		<td><b>Razon Social:</b></td>
	  <td><input type="text" name="razonSocial" value="<%=c.getRazonSocial()%>" size=20></td>
	</tr>
	<tr>
		<td><b>Direccion:</b> </td>
	  <td><input type="text" name="direccion" value="<%=c.getDireccion()%>" size=25 ></td>
	</tr>
	<tr>
		<td><b>Telefono:</b> </td>
	  <td><input type="text" name="telefono" value="<%=c.getTelefono()%>" size=10 onkeypress="return soloNumeros(event)"></td>
	</tr>
	<tr>
		<td><input type="submit" value="editar cliente"></td>
		<td>
		<strong style="color: green;">
		
		<%=successMsg%>
		
		</strong>
		</td>
	</tr>
	</table>
	</form>
</body>
<%@ include file="../../footer.html"%>