<%@page import="com.group7.business.RemitoExteriorVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<body>
<form name="form1" action="./ControladorFacturas" method="POST">
<fieldset>
<legend>Seleccione el remito</legend>
	<select name="listado">
	<%
	RemitoExteriorVO aux;
		List<RemitoExteriorVO> remitos;
		remitos= (List<RemitoExteriorVO>)request.getAttribute("remitos");
		for(Iterator<RemitoExteriorVO> c =remitos.iterator(); c.hasNext();)
		{
			
			aux = c.next();
	%>
		<option value="<%=aux.getNroRemito()%>"><%=aux.getNroRemito() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getCliente().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="show" value="Mostrar el remito"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarFactura">
	 <input type="submit" name="Submit" value="efectuar Factura">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
</body>
<%@ include file="../../footer.html"%>