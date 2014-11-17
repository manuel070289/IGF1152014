<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*" %>

<%
String dSexo = request.getParameter("genero");
CtrlGenero ctrlGenero = new CtrlGenero();
boolean exito = ctrlGenero.crearGenero(dSexo, Short.valueOf(request.getParameter("id_usuario_creador").trim()));

String mensaje;

if(exito){
	mensaje = "Genero creado Exitosamente!";
}else{
	mensaje = "No se ha podido crear el Genero porque ya existe!";
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Género</title>
</head>
<body>
<%= mensaje %>
</body>
</html>