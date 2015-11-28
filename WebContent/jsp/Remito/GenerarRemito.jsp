<%@page import="com.group7.business.OrdenPedidoVO"%>
<%@ page import= "java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<body>
<form name="form1" action="./ControladorRemitos" method="POST">
<fieldset>
<legend>Seleccione la Orden de Pedido</legend>
	<select name="listado">
	<%
		OrdenPedidoVO aux;
		List<OrdenPedidoVO> ordenesPedidos;
		ordenesPedidos= (List<OrdenPedidoVO>)request.getAttribute("ordenesPedidos");
		for(Iterator<OrdenPedidoVO> op =ordenesPedidos.iterator(); op.hasNext();)
		{
			
			aux = op.next();
	%>
		<option value="<%=aux.getNroOrdenPedido()%>"><%=aux.getNroOrdenPedido() + " Fecha:" + aux.getFecha() + " Cliente:" + aux.getCliente().getRazonSocial()%></option>
	<%
		}
	%>
	</select>
	<input type="submit" name="show" value="Mostrar orden de pedido"><br>
	 
	<br>
	 <input type="hidden" name="action" value="efectuarRemito">
	 <input type="submit" name="Submit" value="efectuar Remito">
	 <input type="submit" name="cancelar4" value="Cancelar" onclick="return window.confirm('Esta Seguro que desea cancelar?');" >
</fieldset>
</form>
</body>
<%@ include file="../../footer.html"%>