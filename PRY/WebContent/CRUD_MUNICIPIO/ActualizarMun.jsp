<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%!String mensaje = "";%>
<%
	String id_municipio = request.getParameter("municipio").trim();
	String nomb_municipio = request.getParameter("nomb_municipio").trim();
	
	CtrlMunicipio modifica = new CtrlMunicipio();
	Short umodifica = (Short)session.getAttribute("id_usuario");//2 ;
	
	if (id_municipio.isEmpty())
		mensaje += "<div class='text-warning'> Debe seleccionar un municipio</div>";
	else {
		if (modifica.modificarMunicipio(id_municipio, nomb_municipio, umodifica))
			mensaje += "<div class='text-warning'> El municipio  fue actualizado</div>";
		else

			mensaje += "<div class='text-warning'>El departamento no pude ser actualizado</div>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Municipio Actualizado</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class='container-fluid '>
		<div class="row">
			<div class="col-md-7">
				<fieldset>
						<legend>Informacion</legend>
					</fieldset>
			
			<%=mensaje%>
			</div>
		</div>
	</div>
	<%=mensaje = ""%>
</body>
</html>