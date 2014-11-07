<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*" %>
<%@ page import="dominio.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>



<%
String nombres = request.getParameter("nombres");
String apellidoPaterno = request.getParameter("a_paterno");
String apellidoMaterno = request.getParameter("a_materno");
String fechaNacimiento = request.getParameter("f_nacimiento");
String dui = request.getParameter("dui");
String nit = request.getParameter("nit");
String telefono = request.getParameter("tel");
String email = request.getParameter("email");
String sexo = request.getParameter("sexo");
String fechaIngreso = request.getParameter("f_ingreso");


SimpleDateFormat aux = new SimpleDateFormat("dd/mm/yyyy");

Date f_nacimiento;
Date f_ingreso; 

f_ingreso = (fechaIngreso == "") ? null : aux.parse(fechaIngreso);
f_nacimiento = (fechaNacimiento == "") ? null : aux.parse(fechaNacimiento);

GeneroDAO daoGenero = new GeneroDAO();
Genero genero = daoGenero.daGeneroById(sexo);

CtrlEmpleado ctrlEmpleado = new CtrlEmpleado();

boolean exito = ctrlEmpleado.crearEmpleado(nombres, apellidoPaterno, apellidoMaterno, genero, f_nacimiento, f_ingreso, dui, nit, telefono, email);
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