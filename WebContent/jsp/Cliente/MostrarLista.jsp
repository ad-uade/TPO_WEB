<%@ include file="../../header.html"%>
<%@page import="com.group7.business.ClienteVO"%>
<%@ page import= "java.util.*"%>
<body>
<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Lista de Clientes</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">CUIL Cliente</td>
							<td class="description">Razon Social</td>
							<td class="price">Direccion</td>
							<td class="description">Telefono</td>
							<td class="description">Oficina de Ventas</td>
							<td></td>
						</tr>
					</thead>
					<%
						List<ClienteVO> clientes;
						clientes = (List<ClienteVO>)request.getAttribute("clientes");
						for(ClienteVO aux : clientes){
					%>
					<tbody>
						<tr>
							<td class="cart_product">
								<a href="ControladorCliente?action=display&id=<%=aux.getCuilCliente()%>"><%=aux.getCuilCliente()%></a>
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
							<td class="cart_description">
								<p><%=aux.getODV().getSucursal()%></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
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