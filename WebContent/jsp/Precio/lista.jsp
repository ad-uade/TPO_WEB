<%@page import="com.group7.business.RodamientoVO"%>
<%@ page import= "java.util.*"%>
<%
 List<RodamientoVO> items = (List<RodamientoVO>) session.getAttribute("items");
 List<Float> precios= (List<Float>) session.getAttribute("precios");
 if (items != null && (items.size() > 0) && precios != null && (precios.size() > 0)) {
%> 
<center>
<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
 <tr>
 <td><b>Codigo SFK</b></td>
 <td><b>Codigo Pieza</b></td>
 <td><b>Descripcion</b></td>
 <td><b>Marca</b></td>
 <td><b>Pais Origen</b></td>
 <td><b>Precio Venta</b></td>
 </tr>
 <%
  for (int i=0; i < items.size();i++) {
   RodamientoVO it = (RodamientoVO) items.get(i);
   Float precio= (Float) precios.get(i);
 %>
 <tr>
  <td><%= it.getCodigoSFK()%></td>
  <td><%= it.getCodigoPieza()%></td>
  <td><%= it.getDescripcion()%></td>
  <td><%= it.getMarca() %></td>
  <td><%= it.getPaisOrigen()%></td>
  <td>$ <%= precio%></td>
  <td>
  <form name="deleteForm" action="./ControladorPrecios" method="POST"> 
  	<input type="submit" name="delete" value="Eliminar">
   <input type="hidden" name= "delindex" value='<%= i %>'>
  </form> 
  </td>
</tr> 
<% } %>
</table>
<p>
</center>
<% } %>