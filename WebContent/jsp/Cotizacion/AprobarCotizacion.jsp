<%@ page session="true"%>
<%@page import="com.group7.business.CotizacionVO"%>
<%@page import="com.group7.business.ItemCotizacionVO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<script type="text/javascript">
	function validar() {
		if (document.form4.nrocotizacion.value == '') {
			alert('El campo nrocotizacion esta vacio');
			document.form4.nrocotizacion.focus();
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
	<%
		String fecha = "";
		String cliente = "";
		String nroSolicitud = "";
		String nroCotizacion = "";
		List<ItemCotizacionVO> items = null;
		if (session.getAttribute("cotizacionSeleccionada") != null) {
			CotizacionVO cotizacion = (CotizacionVO) session.getAttribute("cotizacionSeleccionada");

			cliente = cotizacion.getCliente().getRazonSocial();
			fecha = String.valueOf(cotizacion.getFecha());
			nroSolicitud = cotizacion.getNroSolicitudCotizacion();
			nroCotizacion = String.valueOf(cotizacion.getNroCotizacion());
			items = cotizacion.getItems();
		}
	%>
	<br>
		<form name="form4" action="./ControladorCotizacion" method="post"
			onsubmit="return validar();">
			<fieldset>
				<legend>Ingrese el numero de Cotizacion</legend>
				<table>
					<tr>
						<td>Nro de Cotizacion:</td>
						<td><input type="text" onkeypress="return soloNumeros(event)"
							name="nrocotizacion" value=<%=nroCotizacion%>></td>
						<td><input type="submit" name="validarCotizacion"
							value="validar Cotizacion"></td>
					</tr>
					<tr>
						<td><b>Cliente:</b><%=cliente%></td>
						<td><b>Fecha:</b> <%=fecha%></td>
						<td><b>nroSolicitud:</b> <%=nroSolicitud%></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>Seleccione los que desea aprobar</legend>
				Rodamientos de la cotizacion seleccionada: <select name="listado">
					<%
					if (items != null){
					
						for (ItemCotizacionVO aux : items){
								String clave = aux.getRodamiento().getCodigoSFK() + "/" + aux.getRodamiento().getCodigoPieza();
					%>
					<option value="<%=clave%>"><%=aux.getRodamiento().getDescripcion()  + " ---> PRECIO: " + aux.getPrecio()%></option>
					<%
						}
					}
					%>
				</select> <input type="hidden" name="action" value="AprobarItem"></input> <input
					type="submit" name="Submit" value="Aprobar item"></input>
	</br>
	</fieldset>
	</form>
	<jsp:include page="Aprobados.jsp" flush="true" />
	<form name="form7" action="./ControladorCotizacion" method="post">
		<br> <input type="hidden" name="action" value="save"> <input
				type="submit" name="f4Confirmar"
				value="Confirmar aprobacion de cotizacion"> <input
					type="submit" name="f4Cancelar" value="Cancelar"
					onclick="return window.confirm('Esta Seguro que desea cancelar?');">
	</form>
</body>
<%@ include file="../../footer.html"%>