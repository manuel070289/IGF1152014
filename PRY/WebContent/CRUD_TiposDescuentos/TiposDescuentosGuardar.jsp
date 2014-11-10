<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guardar Tipo Descuento</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="panel container-fluid col-xs-7">
		<div class="panel panel-primary ">
			<div class="panel-heading" data-toggle="collapse"
				data-target="#crud_tiposdescuentos" data-parent="#menu_izq">
				<h3 class="panel-title">Tipo Descuentos</h3>
			</div>

			<div class="panel" id="TiposDescuentos">
				<h3 class="panel-title text-warning">Datos del nuevo Tipo Descuento</h3>

				<form action="TiposDescuentosGuardar.jsp" method="post"><HR width="5%">
				<table>
					<tr><td>Fecha de Ingreso:</td> <td><input type="text" name="fecha_ingreso"><br></td></tr>
					<tr><td>Porcentaje de Descuento:</td> <td> <input type="text" name="porcentaje_descuento">%</td></tr>
					<tr><td>Descripción:</td> <td> <input type="text" name="descripcion"></td></tr>
					<tr><td>Id Tipos de Descuentos:</td> <td> <input type="Text"name="id_tiposdescuentos"></td></tr>
						</table>
					<br>
					<br>	
					<input type="submit" class="btn-primary" value="Guardar">
					<input type="reset" class="btn-primary" value="borrar">
			
						
						
				</form>
			</div>
		</div>
	</div>

</body>
</html>