<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>



<%
String nombres = request.getParameter("nombres");
String apellidoPaterno = request.getParameter("a_paterno");
String apellidoMaterno = request.getParameter("a_materno");
String fechaNacimiento = request.getParameter("f_nacimiento");
String dui = request.getParameter("dui");
String nit = request.getParameter("nit");

SimpleDateFormat aux = new SimpleDateFormat("dd/mm/yyyy");

Date f_nacimiento = aux.parse(fechaNacimiento);

CtrlEmpleado ctrlEmpleado = new CtrlEmpleado();
boolean exito = ctrlEmpleado.crearEmpleado(nombres, apellidoPaterno, apellidoMaterno, f_nacimiento, dui, nit);

String mensaje;

if(exito){
	mensaje = "Empleado creado Exitosamente!";
}else{
	mensaje = "No se ha podido crear el empleado porque ya existe!";
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Empleado</title>
</head>
<body>
<%= mensaje %>
</body>
</html>