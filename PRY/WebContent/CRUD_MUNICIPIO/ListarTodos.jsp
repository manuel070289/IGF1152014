<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%!String mensaje=" ";%>

<%
	/* String nomb_municipio = request.getParameter("municipio").trim(); */
	CtrlMunicipio nomina = new CtrlMunicipio();
	/* String nombreDepto; */
	List municipios= nomina.daMunicipios();
	int numeroMunis = municipios.size();
	mensaje +="<table class='table-condensed table-bordered'>"+
					"<tr class='panel-heading'>"+
			"<th class='panel-title'>id_municipio</th>"+
			"<th class='panel-title'>nombre_municipio</th>"+
			"<th class='panel-title'>nombre_depto</th>"+
			"<th class='panel-title'>fecha_creacion</th>"+
			"<th class='panel-title'>fecha_modifica</th>"+
			"</tr>";

	if (municipios.isEmpty())
		mensaje += "</table><div class='text-warning'> No Hay municipios para ese departamento</div>";
	else {
		Municipio muniActual;
			
		for (int i = 0; i < numeroMunis; i++) {
			 muniActual = (Municipio) municipios.get(i); 
			/* Departamento depto =(Departamento) muniActual.getDepartamento(); */
			 mensaje += "<tr><td> " + muniActual.getId_municipio()
					+ "</td> " + "<td> " + muniActual.getNomb_municipio()
					+ "</td> " + "<td> " +muniActual.getDepartamento().getNombre_depto()
					+ "</td> " + "<td> " +muniActual.getFecha_creacion()
					+ "</td> " + "<td> " +muniActual.getFecha_modifica()
					+ "</td></tr>" ;					
		}
		mensaje +="</table>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Municipio</title>
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
				<h3 class='title'>Datos del municipio</h3>
			</div>
			<%=mensaje%>
		</div>
		<%=mensaje=""%>
	</div>
</body>
</html>