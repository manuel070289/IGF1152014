<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%!String mensaje = "";%>
<%
	CtrlPuesto ctrlPuesto = new CtrlPuesto();
	//String id_puesto = request.getParameter("id_puesto").trim();
	String nomb_puesto = request.getParameter("nomb_puesto").trim();
	String perfil_puesto = request.getParameter("perfil_puesto").trim();
	BigDecimal sueldo_min = new BigDecimal(request.getParameter("sueldo_min"));
	BigDecimal sueldo_max = new BigDecimal(request.getParameter("sueldo_max"));
	//String id_usuario = request.getParameter("id_usuario_creador").trim();
	
	if (ctrlPuesto.modificarPuesto(nomb_puesto, perfil_puesto, sueldo_min, sueldo_max) != false)
		mensaje += "Oficina Actualizada";
	else
		mensaje += "Error en la Actualización";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Puesto</title>
</head>
<body>
	<div class='container-fluid '>
		<div class="row">
			<div class="col-md-7">
				<fieldset>
					<legend>Información</legend>
					<%=mensaje%>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>