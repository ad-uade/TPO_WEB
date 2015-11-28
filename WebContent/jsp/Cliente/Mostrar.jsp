<%@ include file="../../header.html"%>
<%@page import="java.util.*"%>
<%@page import="com.group7.business.ClienteVO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<body>
	<%
		ClienteVO c = (ClienteVO) request.getAttribute("cliente");
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
				<h3><%=c.getRazonSocial()%></h3>
				
				<p><label>Cuil:</label> <%=c.getCuilCliente()%></p>
				<p><label>Direccion: </label><%=c.getDireccion()%></p>
				<p><label>Telefono: </label><%=c.getTelefono()%></p>
				<ul class="nav">
					<li><a href="ControladorCliente?action=edit&id=<%=c.getCuilCliente()%>">Editar</a></li>
					<li><a
						href="ControladorCliente?action=baja&id=<%=c.getCuilCliente()%>"><i class="fa fa-times"></i>Dar de baja Cliente</a></li>
				</ul>
			</div>
			<!--/checkout-options-->
		</div>
	</section>
</body>
<%@ include file="../../footer.html"%>