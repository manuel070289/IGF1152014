<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Genero</title>
<!-- <link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script> -->
</head>
<body>
	
		<div class="row">
			<div class="col-md-7">
				<form class="" action="CRUD_GENERO/controlador_CREAR.jsp" method="get" role="form">
					<fieldset>
						<legend>Creaci�n de G�nero</legend>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="nombres">Nombre del Nuevo G�nero:</label> <input
										id="nombres" class="form-control" type="text" name="genero">
								</div>
							</div>
						</div>
					</fieldset>
					<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
					<input class="btn btn-primary" type="submit" value="Crear G�nero">
				</form>
			</div>
		</div>
	
</body>
</html>