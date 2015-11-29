<%@page import="java.util.*"%>
<%@page import="com.group7.business.ProveedorVO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../../header.html"%>
<body>
	<%
		ProveedorVO p = (ProveedorVO) request.getAttribute("proveedor");
	%>
	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Detalle de Clientes</li>
			</ol>
		</div>

		<div class="step-one">
			<h2 class="heading">Cliente</h2>
		</div>
		<div class="checkout-options">
			<h3><%=p.getRazonSocial()%></h3>

			<p>
				<label>Cuil:</label>
				<%=p.getCuilProveedor()%></p>
			<p>
				<label>Direccion: </label><%=p.getDireccion()%></p>
			<p>
				<label>Telefono: </label><%=p.getTelefono()%></p>
			<ul class="nav">
				<li>
					<a href="ControladorProveedor?action=edit&id=<%=p.getCuilProveedor()%>">Editar</a>
				</li>
				<li>
					<a href="ControladorProveedor?action=baja&id=<%=p.getCuilProveedor()%>"><i class="fa fa-times"></i>Dar de baja</a>
				</li>
			</ul>
		</div>
		<!--/checkout-options-->
	</div>
	</section>
</body>
<%@ include file="../../footer.html"%>