
<%@page import="NegocioVO.RodamientoVO"%>
<%@ page import= "java.util.*"%>
<%
 List<RodamientoVO> items = (List<RodamientoVO>) session.getAttribute("items");
 List<Integer> cantidades= (List<Integer>) session.getAttribute("cantidades");
 if (items != null && (items.size() > 0) && cantidades != null && (cantidades.size() > 0)) {
%> 
<center>
<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
 <tr>
 <td><b>Codigo SFK</b></td>
 <td><b>Codigo Pieza</b></td>
 <td><b>Descripcion</b></td>
 <td><b>Marca</b></td>
 <td><b>Pais Origen</b></td>
 <td><b>Cantidad</b></td>
 </tr>
 <%
  for (int i=0; i < items.size();i++) {
   RodamientoVO it = (RodamientoVO) items.get(i);
   Integer cantidad = (Integer) cantidades.get(i);
 %>
 <tr>
  <td><%= it.getCodigoSFK()%></td>
  <td><%= it.getCodigoPieza()%></td>
  <td><%= it.getDescripcion()%></td>
  <td><%= it.getMarca() %></td>
  <td><%= it.getPaisOrigen()%></td>
  <td><%= cantidad%></td>
  <td>
  <form name="deleteForm" action="./ControladorOrdenCompras" method="POST"> 
  	<input type="submit" value="Eliminar">
   <input type="hidden" name= "delindex" value='<%= i %>'>
   <input type="hidden" name="action" value="delete">
  </form> 
  </td>
</tr> 
<% } %>
</table>
<p>
</center>
<% } %>