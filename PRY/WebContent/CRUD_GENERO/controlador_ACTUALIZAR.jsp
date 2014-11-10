<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
Short id_usuario = Short.valueOf(request.getParameter("id_usuario_creador").trim());
String idGenero = request.getParameter("genero");
String nvo_genero = request.getParameter("nvo_genero");


CtrlGenero ctrlGenero = new CtrlGenero();
System.out.println(idGenero);
System.out.println(nvo_genero);
boolean exito = ctrlGenero.modificarGenero(idGenero, nvo_genero, id_usuario);

String mensaje;

if(exito){
	mensaje = "Modificacion Exitosa";
}else{
	mensaje = "Error en la modificacion";
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Genero</title>
</head>
<body>
	<%= mensaje %>
</body>
</html>