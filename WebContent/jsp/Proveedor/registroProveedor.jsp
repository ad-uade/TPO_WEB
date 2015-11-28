<%@ include file="../../header.html"%>
<body>
	<jsp:useBean id="registroProveedor" class="beans.Proveedor" />
	<jsp:setProperty name="registroProveedor"
    				 property="razonSocial"
	    			 param="razonSocial" />
	<jsp:setProperty name="registroProveedor"
    				 property="CUILProveedor"
	    			 param="CUILProveedor" />
	<jsp:setProperty name="registroProveedor"
    				 property="direccion"
	    			 param="direccion" />
	<jsp:setProperty name="registroProveedor"
    				 property="telefono"
	    			 param="telefono" />
<h2 align="center">Datos del Registro de Proveedor</h2>
<table align="center" border="1" cellpadding="3" cellspacing="2">
	<tr align="left" bgcolor="#faf9f8">
		<td>Razon Social:</td>
		<td><jsp:getProperty name="registroProveedor" property="razonSocial" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">	
		<td>CUIL:</td>
		<td><jsp:getProperty name="registroProveedor" property="CUILProveedor" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">
		<td>Direccion:</td>
		<td><jsp:getProperty name="registroProveedor" property="direccion" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">	
		<td>Telefono:</td>
		<td><jsp:getProperty name="registroProveedor" property="telefono" /></td>
	</tr>
	<tr align="left" bgcolor="#faf9f8">	
		<td><a href="/TPO_ClienteWEB/ControladorProveedor?action=alta&id=<%=request.getParameter("CUILProveedor")%>&razonSocial=<%=request.getParameter("razonSocial")%>&direccion=<%=request.getParameter("direccion")%>&telefono=<%=request.getParameter("telefono")%>">Confirmar Proveedor</a></td>
		<td></td>
	</tr>
</table>

</body>
</body>
<%@ include file="../../footer.html" %>
