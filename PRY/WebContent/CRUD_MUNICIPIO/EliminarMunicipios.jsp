<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%-- <%!String depto = "";%> --%>
<%!String muni = "";%>
<%
	/* CtrlDepartamento nomina = new CtrlDepartamento();
	List departamentos = nomina.daDepartamentos();
	int numeroDeptos = departamentos.size();

	if (departamentos.isEmpty())
		depto += "<div class='text-warning'> No Hay Departamentos</div>";
	else {
		Departamento depActual;
		depto += "<select required name='departamento'  >"
				+ "<option value=''>Seleccione</option>";

		for (int i = 0; i < numeroDeptos; i++) {
			depActual = (Departamento) departamentos.get(i);
			depto += "<option value=' " + depActual.getId_depto()
					+ "'> " + depActual.getNombre_depto() + "</option>";

		}
		depto += "</select>";
	} */

	 
	CtrlMunicipio lista = new CtrlMunicipio ();
	List municipios = lista.daMunicipios();
	int numeroMunis = municipios.size();
	
	if (municipios.isEmpty())
		muni += "<div class='text-warning'> No Hay Departamentos</div>";
	else {
		Municipio muniActual;
		muni += "<select required name='municipio'  >"
				+ "<option value=''>Seleccione</option>";

		for (int i = 0; i < numeroMunis; i++) {
			muniActual = (Municipio) municipios.get(i);
			muni += "<option value=' " + muniActual.getId_municipio()+ "'> " + 
							muniActual.getNomb_municipio() + "</option>";

		}
		muni += "</select>";
	} 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Municipio</title>
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
		<div class="panel-heading">
			<h3 class="panel-title">ELIMINAR MUNICIPIO</h3>
		</div>
		<div class="row">
			<div class="col-md-7">
				<form class="" action="ListByDepto.jsp" method="post" role="form">
					<fieldset>
						<legend>Listar Municipios por Departamento</legend>
					</fieldset>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nombres">Seleccione el Municipio:</label>
								<%=muni%>
							</div>
						</div>
					</div>
					<input class="btn btn-primary" type="submit" value="Elimiar Municipio">
				</form>
				<%=muni = ""%>
			</div>
		</div>
	</div>
</body>
</html>