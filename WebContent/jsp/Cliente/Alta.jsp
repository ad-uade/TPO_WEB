<%@page import="com.group7.business.OficinaVentasVO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<script type="text/javascript">
	function validar() {
		if (document.form1.razonSocial.value == '') {
			alert('El campo razonSocial esta vacio');
			document.form1.razonSocial.focus();
			return false;
		}
		if (document.form1.CUILCliente.value == '') {
			alert('El campo CUILCliente esta vacio');
			document.form1.CUILCliente.focus();
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
<body>
	<br>
		<fieldset>
			<div id="contact-page" class="container">
				<div class="bg">
					<div class="row">
						<div class="col-sm-8">
							<div class="contact-form">
								<h2 class="title text-center">Datos de cliente</h2>
								<div class="status alert alert-success" style="display: none"></div>
								<form id="main-contact-form" class="contact-form row" name="contact-form" action="./ControladorCliente" method="post" onsubmit="return validar();">
									<div class="form-group col-md-6">
										<input type="text" name="razonSocial" class="form-control"
											required="required" placeholder="Razon Social"></input>
									</div>
									<div class="form-group col-md-6">
										<input type="text" onkeypress="return soloNumeros(event)"
											name="CuilCliente" class="form-control" required="required"
											placeholder="CUIL"></input>
									</div>
									<div class="form-group col-md-12">
										<input type="text" name="direccion" class="form-control"
											required="required" placeholder="Direccion"></input>
									</div>
									<div class="form-group col-md-12">
										<input type="text" onkeypress="return soloNumeros(event)"
											name="telefono" class="form-control" required="required"
											placeholder="Telefono"></input>
									</div>
									<div class="form-group col-md-6">
										<select name="listadoOficinas">
											<%
												List<OficinaVentasVO> oficinas;
												oficinas = (List<OficinaVentasVO>) request.getAttribute("oficinas");

												if (oficinas != null) {

													for (OficinaVentasVO oficina : oficinas) {
											%>
													<option value="<%=oficina.getIdOficina()%>"><%=oficina.getSucursal()%></option>
											<%
													}
												}
											%>
										</select>
									</div>
									<div class="form-group col-md-12">
										<input type="hidden" name="action" value="altaCliente"></input>
										<input type="submit" name="submit" class="btn btn-primary pull-right" value="Dar de alta"></input>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
</body>
<%@ include file="../../footer.html"%>
