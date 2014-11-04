<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%!String mensaje = "";%>
<%
	String nombre_depto = request.getParameter("nombre_depto").trim();
	CtrlDepartamento nomina = new CtrlDepartamento();
	Departamento departamento = nomina.daDepartamentoByNombre(nombre_depto);
	 mensaje +="<table class='table-condensed table-bordered'>"+
				"<tr class='panel-heading'>"+
		"<th class='panel-title'>id_depto</th>"+
		"<th class='panel-title'>nombre_depto</th>"+
		"<th class='panel-title'>zona_geografica</th>"+
		"</tr>";

	if (departamento == null)
		mensaje += "</table><div class='text-warning'> No Hay Departamentos con ese nombre</div>";	else {

		mensaje += ("<tr><td> " + departamento.getId_depto() + "</td> "
				+ "<td> " + departamento.getNombre_depto()
				+ "</td><td> " + departamento.getZona_geografica()
				+ "</td>" + "</tr>" + "</table>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Departamentos por Nombre</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class='panel container-fluid col-xs-7'>
		<div class='panel panel-primary '>
			<div class='panel-heading'>
				<h3 class='title'>Datos del Departamento <%=nombre_depto %></h3>
			</div>

			<!--<table class='table-condensed table-bordered'>
				<tr class='panel-heading'>
					<th class='panel-title'>id_depto</th>
					<th class='panel-title'>nombre_depto</th>
					<th class='panel-title'>zona_geografica</th>
				</tr> -->
				<%=mensaje%>
			<!-- </table> -->
		</div>
		<%=mensaje=""%>
	</div>
</body>
</html>