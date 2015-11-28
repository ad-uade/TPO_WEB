<%@page import="com.group7.business.RemitoExteriorVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
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
</body>
<%@ include file="../../footer.html"%>