<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="NegocioVO.RemitoExteriorVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<title>Generar conformidad de cliente en Remito</title>
</head>
<body>
<form name="form1" action="./ControladorRemitos" method="POST">
<fieldset>
<legend>Seleccione El remito que desea conformar</legend>
	<select name="listado">
	<%
		RemitoExteriorVO aux;
		List<RemitoExteriorVO> remitos;
		remitos= (List<RemitoExteriorVO>)request.getAttribute("remitos");
		for(Iterator<RemitoExteriorVO> r =remitos.iterator(); r.hasNext();)
		{
			
			aux = r.next();
	%>
		<option value="<%=aux.getNroRemito()%>"><%=aux.getNroRemito() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getCliente().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	
	<br>
	 <input type="hidden" name="action" value="efectuarConformidad">
	 <input type="submit" name="Submit" value="efectuar conformidad">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
<br>
<a href="index.html" target="_self">Volver al index</a>
</body>
</html>