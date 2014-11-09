<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>

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
	<script type="text/javascript"
	src="igf115.js"></script>
	
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
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Ingenieria de Software 2014</a>
    </div>
  </div><!-- /.container-fluid -->
</nav>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div class="panel-group" id="menu_izq">
					<%  if((Short)session.getAttribute("rol")==2){%>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_empleado" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Empleado</h3>
						</div>

						<div id="crud_empleado" class="list-group collapse in">
							<a id="crearEmpleado" href="#" class="list-group-item">Crear</a><a id="obtenerEmpleado" href="#"
								class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
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

							<a href="CRUD_OFICINA/CrearOficina.jsp" class="list-group-item">Crear</a><a href="#"
								class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_departamento" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Departamento</h3>
						</div>
						<div class="list-group list-collapse collapse"
							id="crud_departamento">

							<a href="CRUD_DEPARTAMENTO/CrearDepartamento.html" class="list-group-item">Crear</a>
							<a href="CRUD_DEPARTAMENTO/ListarDepartamentos.html"class="list-group-item">Obtener</a> 
							<a href="CRUD_DEPARTAMENTO/Modificardepartamento.html" class="list-group-item">Actualizar</a> 
							<a href="CRUD_DEPARTAMENTO/EliminararDepartamento.jsp"	class="list-group-item">Eliminar</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_municipio" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Municipio</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_municipio">

							<a href="#" class="list-group-item">Crear</a><a href="#"
								class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_genero" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD G�nero</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_genero">

							<a id="crearGenero" href="#" class="list-group-item">Crear</a><a href="#"
								class="list-group-item">Obtener</a> <a href="#"
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
					<%} %>
					<%  if((Short)session.getAttribute("rol")==1){%>
					<div class="panel panel-primary">
						<div class="panel-heading" data-toggle="collapse"
							data-target="#crud_usuario" data-parent="#menu_izq">
							<h3 class="panel-title">CRUD Usuario</h3>
						</div>
						<div class="list-group list-collapse collapse" id="crud_usuario">

							<a id="#" href="#" class="list-group-item">Crear</a><a href="#"
								class="list-group-item">Obtener</a> <a href="#"
								class="list-group-item">Actualizar</a> <a href="#"
								class="list-group-item">Eliminar</a>

						</div>
					</div>
					<%} %>
				</div>
			</div> <!-- Fin col-md-3 -->
			<div id="dinamico" class="col-md-9">
			</div>
		</div> <!-- Fin row -->
	</div>
</body>
</html>