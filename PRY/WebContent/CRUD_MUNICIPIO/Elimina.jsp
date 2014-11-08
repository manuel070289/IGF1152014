<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%!String mensaje = "";%>
<%
	String id_municipio = request.getParameter("municipio").trim();
	CtrlMunicipio elimina = new CtrlMunicipio();
	if (id_municipio.isEmpty())
		mensaje += "<div class='text-warning'> Debe seleccionar un municipio</div>";
	else {
		if (elimina.eliminarMunicipio(id_municipio))
			mensaje += "<div class='text-warning'> El municipio fue eliminado</div>";
		else

			mensaje += "El Municipio no pude ser eliminado revise si no posee dependencias ";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Municipio Eliminado</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class='panel container-fluid col-xs-7'>
		<div class='panel panel-primary '>
			<div class='panel-heading'>
				<h3 class='title'>Informacion</h3>
			</div>

			<%=mensaje%>
		</div>
	</div>
	<%=mensaje = ""%>

</body>
</html>