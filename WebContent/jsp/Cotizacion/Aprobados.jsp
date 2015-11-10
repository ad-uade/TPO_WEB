
<%@page import="NegocioVO.RodamientoVO"%>
<%@ page import= "java.util.*"%>
<%
 List<String> items = (List<String>) session.getAttribute("itemsElegidos");
 if (items != null && (items.size() > 0)) {
%> 
<center>
<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
 <tr>
 <td><b>Item Aprobado</b></td>
 </tr>
 <%
  for (int i=0; i < items.size();i++) {
   String it = (String) items.get(i);
 %>
 <tr>
  <td><%= it%></td>
  <td>
  <form name="deleteForm" action="./ControladorCotizacion" method="POST"> 
  	<input type="submit" value="Eliminar">
   <input type="hidden" name= "delindex" value='<%= i %>'>
   <input type="hidden" name="action" value="DesaprobarItem">
  </form> 
  </td>
</tr> 
<% } %>
</table>
<p>
</center>
<% } %>