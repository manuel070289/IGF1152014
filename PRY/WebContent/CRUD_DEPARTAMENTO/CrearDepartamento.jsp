<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*" %> 
<%@ page import="dominio.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.BigDecimal" %>

<%! String mensaje = " " ; %>
<%
	 String id_depto = request.getParameter("id_depto").trim();
	 String nombre_depto = request.getParameter("nombre_depto").trim();
	 String zona_geografica = request.getParameter("zona_geografica").trim();
     CtrlDepartamento depto = new CtrlDepartamento();
 	 /* List empleados = nomina.daDepartamentoCriteria(nombre,ciudad);
	 int numeroEmpleados = empleados.size(); */
	 Short creador = 1;
	 Short modifica = 1;
	 
	 
 	 if (depto.crearDepartamento(id_depto, nombre_depto, zona_geografica, creador, modifica))
 		 mensaje = "Departamento ingresado";
 	 else 
 		 mensaje = "No se pudo ingresar";
 		 
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Departamento</title>
</head>
<body>
       <%= mensaje %><br>
</body>
</html>