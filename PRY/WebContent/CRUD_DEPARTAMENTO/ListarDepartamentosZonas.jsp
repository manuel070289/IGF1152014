<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%!String mensaje="";%>
<%
	String zona_geografica = request.getParameter("zona_geografica").trim();
	CtrlDepartamento nomina = new CtrlDepartamento();
	List departamentos = nomina.daDepartamentoByZona(zona_geografica);
	int numeroDeptos = departamentos.size();
	mensaje +="<table class='table-condensed table-bordered'>"+
			"<tr class='panel-heading'>"+
			"<th class='panel-title'>id_depto</th>"+
			"<th class='panel-title'>nombre_depto</th>"+
			"<th class='panel-title'>zona_geografica</th>"+
			"<th class='panel-title'>id_usuario_creador</th>"+
			"<th class='panel-title'>fecha_creacion</th>"+
			"<th class='panel-title'>id_usuario_modifica</th>"+
			"<th class='panel-title'>fecha_modifica</th>"+
			"</tr>";

	if (departamentos.isEmpty())
		mensaje += "</table><div class='text-warning'> No Hay Departamentos en la zona</div>";
	else {
		Departamento depActual;
			
		for (int i = 0; i < numeroDeptos; i++) {
			depActual = (Departamento) departamentos.get(i);
			mensaje += ("<tr><td> " + depActual.getId_depto()
					+ "</td> " + "<td> " + depActual.getNombre_depto()
					+ "</td><td> " + depActual.getZona_geografica()
					+ "</td><td> " + depActual.getId_usuario_creador()
					+ "</td><td> " + depActual.getFecha_creacion()
					+ "</td><td> " + depActual.getId_usuario_modifica()
					+ "</td><td> " + depActual.getFecha_modifica()
					+ "</td>" + "</tr>" );
		}
		mensaje +=  "</table>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Departamentos por Zona</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class='panel container-fluid'>
		<div class='panel panel-primary '>
			<div class='panel-heading'>
				<h3 class='title'>
					Datos de los Departamentos de la zona
					<%=zona_geografica%></h3>
			</div>

						<%=mensaje%>
		</div>
			<!-- <button class="btn-info" onclick="\ListarDepartamentos.html">Regresar</button> -->
	</div>
	<%=mensaje=""%>
</body>
</html>