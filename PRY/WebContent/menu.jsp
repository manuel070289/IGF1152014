<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%
	if ((session.getAttribute("rol") == null || session
			.getAttribute("rol") == "")
			&& (session.getAttribute("id_usuario") == null || session
					.getAttribute("id_usuario") == "")) {
		String site = new String("index.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de Control de Pagos</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="igf115.js"></script>

<script>
	$(document).ready(function() {
		setearBotones();
	});
</script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Ingenieria de Software 2014</a>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div class="panel-group" id="menu_izq">
					<%
						if (session.getAttribute("rol") != null) {
							if ((Short) session.getAttribute("rol") == 2) {
					%>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_empleado" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Empleado</h3>
						</div>

						<div id="crud_empleado" class="list-group collapse in">
							<a id="crearEmpleado" href="#" class="list-group-item">Crear</a><a
								id="obtenerEmpleado" href="#" class="list-group-item">Obtener</a>
							<a href="#" class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>
						</div>


					</div>
					<div class="panel panel-primary" data-toggle="collapse"
						data-target="#crud_puesto" data-parent="#menu_izq">
						<div class="panel-heading">
							<h3 class="panel-title">CRUD Puesto</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_puesto">

							<a href="#" class="list-group-item">Crear</a><a href="#"
								class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_oficina" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Oficina</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_oficina">

							<a href="CRUD_OFICINA/CrearOficina.jsp" class="list-group-item">Crear</a>
							<a href="#" class="list-group-item">Obtener</a> 
							<a href="CRUD_OFICINA/actualizarOficina.jsp"	class="list-group-item">Actualizar</a> 
							<a href="#" class="list-group-item">Eliminar</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_departamento" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Departamento</h3>
						</div>
						<div class="list-group list-collapse collapse"
							id="crud_departamento">

							<a id="crearDeapartamento" href="CRUD_DEPARTAMENTO/CrearDepto.jsp" class="list-group-item">Crear</a>
							<a id="obtenerDepartamento" href="CRUD_DEPARTAMENTO/ListarDepartamentos.html" class="list-group-item">Obtener</a>
							<a id="actualizarDepartamento" href="CRUD_DEPARTAMENTO/ActualizarDepartamento.jsp" class="list-group-item">Actualizar</a> 
							<a id="eliminarDepartamento" href="CRUD_DEPARTAMENTO/EliminarDepartamento.jsp" class="list-group-item">Eliminar</a>
							<a id="darBajaDepartamento" href="CRUD_DEPARTAMENTO/DarBajaDepto.jsp"	class="list-group-item">Dar de Baja</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_municipio" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Municipio</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_municipio">

							<a id="crearMunicipio" href="CRUD_MUNICIPIO/CrearMunicipio.jsp"	class="list-group-item">Crear</a>
							<a id="obtenerMunicipio" href="CRUD_MUNICIPIO/ListarMunicipio.jsp" class="list-group-item">Obtener</a>
							<a id="actualizarMunicipio" href="CRUD_MUNICIPIO/ModificarMunicipio.jsp" class="list-group-item">Actualizar</a>
							<a id="eliminarMunicipio" href="CRUD_MUNICIPIO/EliminarMunicipios.jsp" class="list-group-item">Eliminar</a>
							<a id="darBajaMunicipio" href="CRUD_MUNICIPIO/DarBajaMuni.jsp" class="list-group-item">Dar de Baja</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_genero" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Género</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_genero">

							<a id="crearGenero" href="#" class="list-group-item">Crear</a><a
								href="#" class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_boleta_pago" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Boleta de pago</h3>
						</div>
						<div class="list-group list-collapse collapse"
							id="crud_boleta_pago">

							<a href="#" class="list-group-item">Crear</a><a href="#"
								class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<%
						}
						}
					%>
					<%
						if (session.getAttribute("rol") != null) {
							if ((Short) session.getAttribute("rol") == 1) {
					%>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_usuario" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Usuario</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_usuario">

							<a href="CRUD_USUARIO/crearUsuario.jsp" class="list-group-item">Crear</a><a
								href="#" class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<%
						}
						}
					%>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading" data-toggle="collapse"
						data-target="cerrarSesion.jsp" data-parent="#menu_izq">
						<a href="cerrarSesion.jsp" style="color: white;"><b>Cerrar
								Sesión</b></a>
					</div>
				</div>
			</div>
			<!-- Fin col-md-3 -->
			<div id="dinamico" class="col-md-9"></div>
		</div>
		<!-- Fin row -->
	</div>
</body>
</html>