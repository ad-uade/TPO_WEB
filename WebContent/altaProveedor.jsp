<%@ include file="header.html" %>
<body>
<script type="text/javascript">
function validar(){
	if(document.form.razonSocial.value==''){
		alert('El campo razonSocial esta vacio');
		document.form.razonSocial.focus();
		return false;
	}
	if(document.form.CUILCliente.value==''){
		alert('El campo CUILCliente esta vacio');
		document.form.CUILCliente.focus();
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
<p/>

<fieldset>
			<div id="contact-page" class="container">
				<div class="bg">
					<div class="row">
						<div class="col-sm-8">
							<div class="contact-form">
								<h2 class="title text-center">Alta de Proveedor</h2>
								<div class="status alert alert-success" style="display: none"></div>
								<form id="main-contact-form" class="contact-form row" name="contact-form" action="jsp/Proveedor/registroProveedor.jsp" method="POST" onsubmit="return validar();">
									<div class="form-group col-md-6">
										<input type="text" name="razonSocial" class="form-control"
											required="required" placeholder="Razon Social">
									</div>
									<div class="form-group col-md-6">
										<input type="text" onkeypress="return soloNumeros(event)"
											name="CUILProveedor" class="form-control" required="required"
											placeholder="CUIL">
									</div>
									<div class="form-group col-md-12">
										<input type="text" name="direccion" class="form-control"
											required="required" placeholder="Direccion">
									</div>
									<div class="form-group col-md-12">
										<input type="text" onkeypress="return soloNumeros(event)"
											name="telefono" class="form-control" required="required"
											placeholder="Telefono">
									</div>
									<div class="form-group col-md-12">
										<input type="submit" name="submit" class="btn btn-primary pull-right" value="Dar de alta">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</fieldset>
</body>
<%@ include file="footer.html" %>
