<%@ page session="true" %>
<%@page import="com.group7.business.SolicitudCotizacionVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<script type="text/javascript">
function validar(){
	if(document.form3.diasValidez.value==''){
		alert('El campo diasValidez esta vacio');
		document.form3.diasValidez.focus();
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
<form name="form3" action="./ControladorCotizacion" method="post" onsubmit="return validar();">
<fieldset>
<legend>Cabecera Cotizacion</legend>
	Solicitudes de Cotizacion:
	<select name="listado">
	<%
		SolicitudCotizacionVO aux;
		List<SolicitudCotizacionVO> solicitudes;
		solicitudes= (List<SolicitudCotizacionVO>)request.getAttribute("solicitudes");
		for(Iterator<SolicitudCotizacionVO> sc =solicitudes.iterator(); sc.hasNext();)
		{
			
			aux = sc.next();
	%>
		<option value="<%=aux.getNroSolicitudCotizacion()%>"><%=aux.getNroSolicitudCotizacion() + " " + aux.getFecha()%></option>
	<%
		}
	%>
	</select>
	 <input type="hidden" name="action" value="displaysolicitud">
	 <input type="submit" name="Submit" value="Ver solicitud de cotizacion"><br>
</fieldset>
<br>
	Dias Validez:<input type="text" name="diasValidez" SIZE="3" value=1 onkeypress="return soloNumeros(event)">
	 <input type="submit" name="f3Confirmar" value="Generar Cotizacion">
	 <input type="submit" name="f3Cancelar" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
	 <br>
</form>
</body>
<%@ include file="../../footer.html"%>