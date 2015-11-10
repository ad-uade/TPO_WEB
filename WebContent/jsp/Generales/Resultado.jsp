<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado operacion</title>
</head>
<body>
	<%
	Boolean bandera = (Boolean)request.getAttribute("bandera");
	String successMsg = "";
	if(bandera)
		successMsg="Elemento guardado correctamente";
	else
		successMsg="Error en los datos";
	
	%>
</body>
<%=successMsg %><br>
<a href="index.html" target="_self">Volver al index</a> 

</html>