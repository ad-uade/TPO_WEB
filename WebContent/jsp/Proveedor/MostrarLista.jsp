<%@ include file="../../header.html"%>

<%@page import="com.group7.business.ProveedorVO"%>
<%@ page import="java.util.*"%>
<body>
<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Lista de Proveedores</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">CUIL Proveedor</td>
							<td class="description">Razon Social</td>
							<td class="price">Direccion</td>
							<td class="description">Telefono</td>
							<td></td>
						</tr>
					</thead>
					<%
						ProveedorVO aux;
						List<ProveedorVO> proveedores;
						proveedores = (List<ProveedorVO>) request.getAttribute("proveedores");
						for (Iterator<ProveedorVO> p = proveedores.iterator(); p.hasNext();) {
							aux = p.next();
					%>
					<tbody>
						<tr>
							<td class="cart_product">
								<a href="ControladorProveedor?action=display&id=<%=aux.getCuilProveedor()%>"><%=aux.getCuilProveedor()%></a>
							</td>
							<td class="cart_description">
								<p><%=aux.getRazonSocial()%></p>
							</td>
							<td class="cart_description">
								<p><%=aux.getDireccion()%></p>
							</td>
							<td class="cart_description">
								<p><%=aux.getTelefono()%></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="ControladorProveedor?action=baja&id=<%=aux.getCuilProveedor()%>"><i class="fa fa-times"></i></a>
							</td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
</body>
<%@ include file="../../footer.html"%>