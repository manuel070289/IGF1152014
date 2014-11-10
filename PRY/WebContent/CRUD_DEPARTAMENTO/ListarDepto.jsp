<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Departamentos</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
			<div class='panel-heading'>
				<h3 class='title'>LISTAR DEPARTAMENTOS</h3>
			</div>

			<div class="panel" id="listarDepartamentosZonas"
				class="list-group collapse in">
				<h3 class="panel-title">Listar departamento por zona</h3>
				<form action="ListarDepartamentosZonas.jsp">
					Digite la zona: <input type="text" name="zona_geografica" /> <input
						type="submit" class="btn-primary" name="zonas" value="Listar" />
				</form>
			</div>
			<div class="panel" id="listarDepartamentosNombre"
				class="list-group collapse in">
				<h3 class="panel-title">Listar Departamento por Nombre</h3>
				<form action="ListarDepartamentosNombre.jsp">
					Digite el nombre : <input type="text" name="nombre_depto" /> <input
						type="submit" class="btn-primary" name="nombres" value="Listar" />
				</form>
			</div>
			<div class="panel" id="listarDepartamentos"
				class="list-group collapse in">
				<h3 class="panel-title">Listar Todos Los Departamentos</h3>
				<form action="ListarDepartamentos.jsp">
					<input type="submit" class="btn-primary" name="todos" value="Listar" />
				</form>

			</div>


		</div>
	</div>
</body>
</html>