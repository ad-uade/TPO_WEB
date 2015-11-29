<%@ include file="header.html" %>
<body>
<script type="text/javascript">
        function validarPath()
        {
            var file=document.Form.path.value;

            if (file=="")
                alert("Debe seleccionar un archivo");
            else
                document.form.submit();
        }

        function validar(){
        	if(document.form.path.value==''){
        		alert('El campo path esta vacio');
        		document.form.path.focus();
        		return false;
        	}
        }
</script>
</head>
<body>
<fieldset>
			<div id="contact-page" class="container">
				<div class="bg">
					<div class="row">
						<div class="col-sm-8">
							<div class="contact-form">
								<h2 class="title text-center">Alta de Rodamiento</h2>
								<div class="status alert alert-success" style="display: none"></div>
								<form id="main-contact-form" class="contact-form row" name="contact-form" action="./ControladorRodamientos" method="post" onsubmit="return validar();">
									
									<div class="form-group col-md-6">
									<p><b>Path XML</b></p>
										<input type="file" name="path">
									</div>
									<div class="form-group col-md-12">
										<input type="submit" name="Submit" value="Procesar" class="btn btn-primary pull-right" onclick="javascript:return validarPath();">
										<input type="hidden" name="action" value="procesar">
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

