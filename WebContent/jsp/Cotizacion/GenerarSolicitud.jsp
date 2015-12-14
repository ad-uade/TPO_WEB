<%@page import="com.group7.business.CondicionVentaVO"%>
<%@ page session="true"%>
<%@page import="com.group7.business.RodamientoVO"%>
<%@page import="com.group7.business.ClienteVO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<script type="text/javascript">
	function validar() {
		if (document.form1.cantidad.value == '') {
			alert('El campo cantidad esta vacio');
			document.form1.cantidad.focus();
			return false;
		}
		if (document.form1.clienteid.value == '') {
			alert('El campo clienteid esta vacio');
			document.form1.clienteid.focus();
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
		String cliente = "";
		String cuit = "";
		if (session.getAttribute("clienteSeleccionado") != null) {
			ClienteVO c = (ClienteVO) session.getAttribute("clienteSeleccionado");
			cliente = c.getRazonSocial();
			cuit = String.valueOf(c.getCuilCliente());
		}
	%>
<form name="form1" action="./ControladorCotizacion" method="post"  onsubmit="return validar();">
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
	Cantidad:<input type="text" name="cantidad" size="3" value="1" onkeypress="return soloNumeros(event)"></input>
	 <input type="hidden" name="action" value="add">
	 <input type="submit" name="Submit" value="Agregar item"><br>
</fieldset>
</form>	
	<jsp:include page="Carrito.jsp" flush="true" />

	<form class="contact-form row" name="form2" action="./ControladorCotizacion" method="post">
		<div class="form-group col-md-12">
			<input class="btn btn-primary pull-right" type="submit" name="f2Confirmar" value="Confirmar solicitud"></input>
			<input type="hidden" name="action" value="save"></input> 
		</div>
		<div class="form-group col-md-12">
			<input class="btn btn-primary pull-right" type="submit" name="f2Cancelar" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');"></input>
		</div>
	</form>	
</div>		
</body>
<%@ include file="../../footer.html"%>