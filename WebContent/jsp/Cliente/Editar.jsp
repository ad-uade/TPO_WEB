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
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Editar Cliente</li>
				</ol>
			</div>

			<div class="step-one">
				<h2 class="heading">Cliente <%=c.getCuilCliente()%></h2>
			</div>
			<div class="checkout-options">
			<form name="form" action="ControladorCliente?action=save&id=<%=c.getCuilCliente()%>" method="post" onsubmit="return validar();">
			<div class="form-group col-md-6">
				<p>Razon Social</p>
				<input type="text" name="razonSocial" class="form-control" required="required" value="<%=c.getRazonSocial()%>">
			</div>
			<div class="form-group col-md-6">
				<p>Direccion</p>
				<input type="text" name="direccion" class="form-control" required="required" value="<%=c.getDireccion()%>"">
			</div>
			<div class="form-group col-md-6">
				<p>Telefono</p>
				<input type="text" name="telefono" class="form-control" required="required" onkeypress="return soloNumeros(event)" value="<%=c.getTelefono()%>">
			</div>
				<div class="form-group col-md-12">
						<input type="submit" name="submit" class="btn btn-primary pull-right" value="Guardar">
				</div>
				<strong style="color: green;">
				<%=successMsg%>
				</strong>
			</form>	
			</div>
			<!--/checkout-options-->
		</div>
	</section>
</body>
<%@ include file="../../footer.html"%>