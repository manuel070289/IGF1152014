<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.math.BigDecimal"%>


<%
	String nomb_puesto = request.getParameter("nomb_puesto").trim();
	String perfil_puesto = request.getParameter("perfil_puesto").trim();
	String fecha_ing = request.getParameter("fecha_ing");
	BigDecimal sueldo_min = new BigDecimal(request.getParameter("sueldo_min"));
	BigDecimal sueldo_max = new BigDecimal(request.getParameter("sueldo_max"));
	Short id_usuario = Short.valueOf(request.getParameter("id_usuario_creador").trim());
	//Short id_usuario = 1;

	SimpleDateFormat aux = new SimpleDateFormat("dd/mm/yyyy");
	Date f_ingreso;
	f_ingreso = (fecha_ing == "") ? null : aux.parse(fecha_ing);

	CtrlPuesto puesto = new CtrlPuesto();
	boolean exito = puesto.guardarPuesto(nomb_puesto, perfil_puesto,
			f_ingreso, sueldo_min, sueldo_max, id_usuario);
	String mensaje;

	if (exito) {
		mensaje = "Puesto creado Exitosamente!";
	} else {
		mensaje = "No se ha podido crear el puesto porque ya existe!";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Puesto</title>
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
					<legend>Información</legend>
					<%=mensaje%>
					<form class="" action="crearPuesto.jsp" method="get" role="form">
						<div class="row">
							<div class="col-md-12">
								<input class="btn btn-primary" type="submit" value="Regresar">
							</div>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>