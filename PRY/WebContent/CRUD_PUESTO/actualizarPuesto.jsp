<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%!String mensaje = "";%>
<%
	CtrlPuesto catalogo = new CtrlPuesto();
	List puesto = catalogo.daPuestoTodos();
	int numPuesto = puesto.size();
	if (puesto.isEmpty())
		mensaje += "<div class='text-warning'> No Hay Puestos</div>";
	else {
		Puesto puestoActual;
		mensaje += "<select required name='id_puesto' onchange='cargarPuesto(this.value);'>"
				+ "<option value=''>Seleccione</option>";
		for (int i = 0; i < numPuesto; i++) {
			puestoActual = (Puesto) puesto.get(i);
			mensaje += "<option value=' " + puestoActual.getId_puesto()
					+ "'> " + puestoActual.getNomb_puesto() + "</option>";
		}
		mensaje += "</select>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Puesto</title>
<link rel="stylesheet" type="text/css" 	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css" 	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript" 	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../JS/ajax.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form class="" action="CRUD_PUESTO/actualizaPuesto.jsp" method="get" role="form">
					<fieldset>
						<legend>ACTUALIZAR PUESTO</legend>
						<div class="row">
						<div class="col-md-7">
							<div class="form-group">
								<label>Puestos Almacenados: </label>
								<%=mensaje%>
								<!--  <select data-placeholder="Elija un Puesto" class="form-control" name="puesto">
									<%=mensaje%>
								</select>-->
							</div>
						</div>
					</div>
					</fieldset>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label for="nombres">Nuevo Nombre:</label> <input id="nvo_puesto"
										class="form-control" type="text" name="nvo_puesto">
								</div>
							</div>
							<div class="col-md-4">
							<div class="form-group">
								<label for="perfil_puesto">Nuevo Perfil del Puesto:</label> <input
									id="nvo_perfil_puesto" class="form-control" type="text"
									name="nvo_perfil_puesto">
							</div>
						</div>
						</div>
						<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="sueldo_min">Sueldo Minimo:</label>
								<div class="input-group">
									<span class="input-group-addon">$</span><input id="nvo_sueldo_min"
										class="form-control" type="text" name="nvo_sueldo_min">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="sueldo_max">Sueldo Máximo:</label>
								<div class="input-group">
									<span class="input-group-addon">$</span><input id="nvo_sueldo_max"
										class="form-control" type="text" name="nvo_sueldo_max">
								</div>
							</div>
						</div>
						</div>
						<div class="row">
						<div class="col-md-12">
							<input type="hidden" name="id_usuario_creador"
								value="<%=session.getAttribute("id_usuario")%>"> <input
								class="btn btn-primary" type="submit" value="Modificar Puesto">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>


