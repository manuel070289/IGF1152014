<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%! String mensaje = "" ; %>
<%
	CtrlDepartamento nomina = new CtrlDepartamento();
 	List departamentos = nomina.daDepartamentos();
	int numeroDeptos = departamentos.size();
			
 	if (departamentos.isEmpty())
		mensaje += "<div class='text-warning'> No Hay Departamentos</div>";
 	else {
		Departamento depActual;
		mensaje += "<select name='id_depto' required name='departamento'  onchange='cargarMun(this.value);'>"+
	 			"<option value=''>Seleccione</option>";
	 for (int i=0; i < numeroDeptos; i++) {
		 depActual = (Departamento) departamentos.get(i);
			mensaje += "<option value=' " + depActual.getId_depto() + "'> " + depActual.getNombre_depto()+"</option>";	
	 }
	 mensaje += "</select>";
 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Oficina</title>
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
				<form class="" action="crearOfic.jsp" method="post" role="form">
					<fieldset>
						<legend>CREAR OFICINA</legend>
					</fieldset>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<label for="departamento">Seleccione el departamento:</label>
								<%=mensaje %>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="municipio">Seleccione el municipio:</label>
								<div id="muni" name="muni"></div>
							</div>
						</div>
						
						<div class="col-sm-7">
							<div class="form-group">
								<label for="domicilio">Domicilio de la Oficina:</label>
								<input id="domicilio"	class="form-control" type="text" name="domicilio" required>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nomb_oficina">Nombre de la Oficina:</label>
								<input id="nomb_oficina" class="form-control" type="text" name="nomb_oficina" required>
							</div>
						</div>
						<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
						<div class="col-sm-7">
							<div class="form-group">
								<input class="btn btn-primary" type="submit" value="Crear Oficina" >	
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%=mensaje=""%>
	</div>
</body>
</html>