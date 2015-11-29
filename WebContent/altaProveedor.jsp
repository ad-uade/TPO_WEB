<%@ include file="header.html"%>
<body>
	<script type="text/javascript">
		function validar() {
			if (document.form.razonSocial.value == '') {
				alert('El campo razonSocial esta vacio');
				document.form.razonSocial.focus();
				return false;
			}
			if (document.form.cuilProveedor.value == '') {
				alert('El campo cuilProveedor esta vacio');
				document.form.cuilProveedor.focus();
				return false;
			}
			if (document.form.direccion.value == '') {
				alert('El campo direccion esta vacio');
				document.form.direccion.focus();
				return false;
			}
			if (document.form.telefono.value == '') {
				alert('El campo telefono esta vacio');
				document.form.telefono.focus();
				return false;
			}
		}

		function soloNumeros(evt) {
			if (window.event) {
				keynum = evt.keyCode;
			} else {
				keynum = evt.which;
			}
			if (keynum > 47 && keynum < 58) {
				return true;
			} else {
				return false;
			}
		}
	</script>
	<p />

	<fieldset>
		<div id="contact-page" class="container">
			<div class="bg">
				<div class="row">
					<div class="col-sm-8">
						<div class="contact-form">
							<h2 class="title text-center">Alta de Proveedor</h2>
							<div class="status alert alert-success" style="display: none"></div>
							<form id="main-contact-form" class="contact-form row" action="./ControladorProveedor" method="post" onsubmit="return validar();">
								<div class="form-group col-md-6">
									<input type="text" name="razonSocial" class="form-control"
										placeholder="Razon Social"></input>
								</div>
								<div class="form-group col-md-6">
									<input type="text" onkeypress="return soloNumeros(event)"
										name="cuilProveedor" class="form-control" 
										placeholder="CUIL"></input>
								</div>
								<div class="form-group col-md-12">
									<input type="text" name="direccion" class="form-control"
										placeholder="Direccion"></input>
								</div>
								<div class="form-group col-md-12">
									<input type="text" onkeypress="return soloNumeros(event)"
										name="telefono" class="form-control" 
										placeholder="Telefono"></input>
								</div>
								<div class="form-group col-md-12">
									<input type="hidden" name="action" value="alta"></input>
									<input type="submit" name="submit"
										class="btn btn-primary pull-right" value="Dar de alta"></input>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</fieldset>
</body>
<%@ include file="footer.html"%>
