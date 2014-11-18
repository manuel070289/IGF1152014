<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<!DOCTYPE html>
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
<link href="../bootstrap-3.2.0-dist/calendario_dw/calendario_dw-estilos.css" type="text/css" rel="STYLESHEET">

<script type="text/javascript" src="calendario_dw/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="calendario_dw/calendario_dw.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
   $(".campofecha").calendarioDW();
})
</script>  
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form class="" action="creaPuesto.jsp" method="post" role="form">
					<fieldset>
						<legend>Información del Puesto</legend>
					</fieldset>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="nomb_puesto">Nombre del Puesto:</label> <input
									id="nombre_puesto" class="form-control" type="text"
									name="nomb_puesto" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="perfil_puesto">Perfil del Puesto:</label> <input
									id="perfil_puesto" class="form-control" type="text"
									name="perfil_puesto" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="fecha_ing">Fecha de Ingreso:</label> <input
									id="fecha_ing" class="form-control"  type="text"
									name="fecha_ing" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="sueldo_min">Sueldo Minimo:</label>
								<div class="input-group">
									<span class="input-group-addon">$</span><input id="sueldo_min"
										class="form-control" type="text" name="sueldo_min" required="required">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="sueldo_max">Sueldo Máximo:</label>
								<div class="input-group">
									<span class="input-group-addon">$</span><input id="sueldo_max"
										class="form-control" type="text" name="sueldo_max" required="required">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input type="hidden" name="id_usuario_creador"
								value="<%=session.getAttribute("id_usuario")%>"> <input
								class="btn btn-primary" type="submit" value="Crear Puesto">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>