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
		mensaje += "<select required name='departamento'  onchange='cargarMun(this);'>"+
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
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form class="" action="CrearMun.jsp" method="post" role="form">
					<fieldset>
						<legend>CREAR OFICINA</legend>
					</fieldset>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nombres">Seleccione el departamento:</label>
								<%=mensaje %>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nombres">Seleccione el municipio:</label>
								<%=mensaje %>
							</div>
						</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nomb_municipio">Nombre de la Oficina:</label>
								<input id="nomb_municipio"	class="form-control" type="text" name="nombOficina" required>
							</div>
						</div>
						
					</div>
					<input class="btn btn-primary" type="submit" value="Crear Oficina" >
				</form>
			</div>
			<%=mensaje=""%>
		</div>
	</div>
</body>
</html>