<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%! String mensaje = "" ; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear un nuevo departamento</title>
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
				<form action="CrearDepartamento.jsp" method="post">
					<fieldset>
						<legend>CREAR DEPARTAMENTO</legend>
					</fieldset>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<label for="id_depto">Digite el id del departamento:</label>
						 		<input id="id_depto" type="text" name="id_depto" class="form-control" required/>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nombre_depto">Digite el nombre del departamento: </label>
						 		<input id="nombre_depto" type="text"	name="nombre_depto" class="form-control" required/> 
							</div>
						</div>
						
						<div class="col-sm-7">
							<div class="form-group">
								<label for="zona_geografica">Digite la zona geografica: </label>
						 		 <input id="zona_geografica" 	type="text" name="zona_geografica" class="form-control" required/>  
						 	</div>
						</div>
					</div>  
						  <input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
						  <input type="submit" class="btn-primary" value="Ingresar" />
		 		</form>
			</div>
		</div>
	</div>
</body>
</html>