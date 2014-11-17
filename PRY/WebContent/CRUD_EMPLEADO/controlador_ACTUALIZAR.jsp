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
String id_puesto = request.getParameter("puesto");
String oficina = request.getParameter("oficina");
String jefe = request.getParameter("jefe");
String sueldo = request.getParameter("sueldo");
String activo = request.getParameter("activo");


SimpleDateFormat aux = new SimpleDateFormat("dd/MM/yyyy");

Date f_nacimiento;
Date f_ingreso; 

f_ingreso = (fechaIngreso == "") ? null : aux.parse(fechaIngreso);
f_nacimiento = (fechaNacimiento == "") ? null : aux.parse(fechaNacimiento);

GeneroDAO daoGenero = new GeneroDAO();
Genero genero = daoGenero.daGeneroById(sexo);

OficinaDAO daoOficina = new OficinaDAO();
Oficina objOficina = daoOficina.daoOficinaById(oficina);

PuestoDAO daoPuesto = new PuestoDAO();
Puesto puesto = daoPuesto.daPuestoById(Short.parseShort(id_puesto));

jefe = (jefe.equals("ninguno"))? null : jefe;

BigDecimal objSueldo = new BigDecimal(sueldo);

CtrlEmpleado ctrlEmpleado = new CtrlEmpleado();

boolean exito = ctrlEmpleado.modificarEmpleado(nombres, apellidoPaterno, apellidoMaterno, genero, f_nacimiento, f_ingreso, dui, nit, telefono, email, objOficina, jefe, objSueldo, activo, puesto, id_usuario);
String mensaje;

if(exito){
	mensaje = "Empleado actualizado exitosamente";
}else{
	mensaje = "Ocurrio un error en la actualizacion";
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