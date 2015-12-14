<%@page import="com.group7.business.RodamientoVO"%>
<%@page import="com.group7.business.SolicitudCotizacionVO"%>
<%@page import="com.group7.business.ItemSolicitudCotizacionVO"%>
<%@ page import= "java.util.*"%>
<%

 SolicitudCotizacionVO solicitud = (SolicitudCotizacionVO) session.getAttribute("solicitudCotizacionVO");
 
 if (solicitud != null) {
%> 
<center><p>CARRITO</p></center>
</br>
<table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
 <tr>
 <td><b>Codigo SFK</b></td>
 <td><b>Codigo Pieza</b></td>
 <td><b>Descripcion</b></td>
 <td><b>Marca</b></td>
 <td><b>Pais Origen</b></td>
 <td><b>Condicion Venta</b></td>
 <td><b>Cantidad</b></td>
 </tr>
 <%
  for (ItemSolicitudCotizacionVO items: solicitud.getItems()) {
   RodamientoVO it = (RodamientoVO) items.getRodamiento();
   Integer cantidad = (Integer) items.getCantidad();
 %>
 <tr>
  <td><%= it.getCodigoSFK()%></td>
  <td><%= it.getCodigoPieza()%></td>
  <td><%= it.getDescripcion()%></td>
  <td><%= it.getMarca() %></td>
  <td><%= it.getPaisOrigen()%></td>
  <td><%= cantidad%></td>
  <td>
  <form name="deleteForm" action="./ControladorCotizacion" method="post"> 
	  <input type="submit" value="Eliminar"></input>
	   <input type="hidden" name= "delindex" value='<%= it.getCodigoSFK() %>'></input>
	   <input type="hidden" name="action" value="delete"></input>
  </form> 
  </td>
</tr> 
<% } %>
</table>
</center>
<% } %>