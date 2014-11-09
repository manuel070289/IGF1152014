<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Usuario</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../JS/ajax.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form class="" action="crearUsua.jsp" method="post" role="form">
					<fieldset>
						<legend>CREAR USUARIO</legend>
					</fieldset>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nombre">Nombres:</label>
								<input id="nombre"	class="form-control" type="text" name="nombre" required>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="apellido">Apellidos:</label>
								<input id="nomb_municipio"	class="form-control" type="text" name="apellido" required>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="genero">Genero:</label>
								<select required name='genero'>
	 								<option value=''>Seleccione</option>
	 								<option value='F'>Femenino</option>
	 								<option value='M'>Masculino</option>
	 							</select>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="username">Nombre de Usuario:</label>
								<input id="username"	class="form-control" type="text" name="username" required>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="passwd">Contraseña de Usuario:</label>
								<input id="passwd"	class="form-control" type="text" name="passwd" required>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="rol">Rol:</label>
								<select required name='rol'>
	 								<option value=''>Seleccione</option>
	 								<option value='1'>Administrador</option>
	 								<option value='2'>Usuario Comun</option>
	 								<option value='3'>Usuario Planilla</option>
	 							</select>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<input class="btn btn-primary" type="submit" value="Crear Usuario" >	
							</div>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<script>
	</script>
</body>
</html>