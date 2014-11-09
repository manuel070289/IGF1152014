<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.math.BigDecimal"%>


<%
String nomb_puesto = request.getParameter("nomb_puesto");
String perfil_puesto = request.getParameter("perfil_puesto");
String fecha_ingreso = request.getParameter("fecha_ing");
BigDecimal sueldo_min = new BigDecimal(request.getParameter("sueldo_min"));
BigDecimal sueldo_max = new BigDecimal(request.getParameter("sueldo_max"));
String id_usuario_creador = request.getParameter("id_usuario_creador");
String id_usuario_modifica = request.getParameter("id_usuario_modifica");
String fecha_crea = request.getParameter("fecha_creacion");
String fecha_mod = request.getParameter("fecha_modifica");
//Integer activo = Integer.parseInt(request.getParameter("1"));

SimpleDateFormat aux = new SimpleDateFormat("dd/mm/yyyy");

Date fecha_ing = aux.parse(fecha_ingreso);
Date fecha_creacion = aux.parse(fecha_crea);
Date fecha_modifica = aux.parse(fecha_mod);


CtrlPuesto puesto = new CtrlPuesto();
boolean exito = puesto.guardarPuesto(nomb_puesto, perfil_puesto, fecha_ing, sueldo_min, sueldo_max, id_usuario_creador, id_usuario_modifica, fecha_ing, fecha_ing, 1);
String mensaje;

if(exito){
	mensaje = "Puesto creado Exitosamente!";
}else{
	mensaje = "No se ha podido crear el puesto porque ya existe!";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Puesto</title>
</head>
<body>

</body>
</html>