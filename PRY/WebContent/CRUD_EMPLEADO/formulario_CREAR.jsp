<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.List"%>


<%
	String aux = "";
	GeneroDAO daoGenero = new GeneroDAO();
	List<Genero> lista = daoGenero.dameTodosLosGeneros();
	for (int i = 0; i < lista.size(); i++) {
		aux = aux + "<option value=" + lista.get(i).getId_sexo() + ">"
				+ lista.get(i).getD_sexo() + "</option>";
	}

	String oficinas = "";
	OficinaDAO daoOficina = new OficinaDAO();
	List<Oficina> listaOficina = daoOficina.daoOficina();
	for (int i = 0; i < listaOficina.size(); i++) {
		oficinas = oficinas + "<option value="
				+ listaOficina.get(i).getIdOficina() + ">"
				+ listaOficina.get(i).getNombOficina() + "</option>";
	}

	String jefes = "";
	EmpleadoDAO daoEmpleado = new EmpleadoDAO();
	List<Empleado> listaEmpleados = daoEmpleado.dameTodosLosEmpleados();
	for (int i = 0; i < listaEmpleados.size(); i++) {
		jefes = jefes + "<option value="
				+ listaEmpleados.get(i).getIdEmpleado() + ">"
				+ listaEmpleados.get(i).getNombres() + " "
				+ listaEmpleados.get(i).getApellidoPaterno() + " "
				+ listaEmpleados.get(i).getApellidoMaterno()
				+ "</option>";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Empleado</title>
<!-- <link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script> -->
</head>
<body>
	<!-- <div class="container-fluid">
		<div class="row">
			<div class="col-md-7"> -->
	<form class="" action="CRUD_EMPLEADO/crear.jsp" method="get"
		role="form">
		<div class="row">
			<div class="col-md-7">
				<fieldset>
					<legend>Información Personal</legend>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="nombres">Nombres:</label> <input id="nombres"
									class="form-control" type="text" name="nombres"
									required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="a_paterno">A. Paterno:</label> <input id="a_paterno"
									class="form-control" type="text" name="a_paterno"
									required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="a_materno">A. Materno:</label> <input id="a_materno"
									class="form-control" type="text" name="a_materno"
									required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="f_nacimiento">F. Nacimiento:</label> <input
									id="f_nacimiento" class="form-control" type="text"
									name="f_nacimiento" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="dui">DUI:</label> <input id="dui"
									class="form-control" type="text" name="dui"
									placeholder="99999999-9" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="nit">NIT:</label> <input id="nit"
									class="form-control" type="text" name="nit"
									placeholder="9999-999999-999-9" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="tel">Teléfono:</label> <input id="tel"
									class="form-control" type="text" name="tel"
									placeholder="99999999" required="required">
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<label for="email">E-mail:</label> <input id="email"
									class="form-control" type="text" name="email"
									placeholder="ejemplo@ejemplo.com" required="required">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Sexo:</label> <select class="form-control" name="sexo"><%=aux%></select>
							</div>
						</div>
					</div>
				</fieldset>

			</div>
			<div class="col-md-5">
				<fieldset>
					<legend>Información del Puesto</legend>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="f_ingreso">F. Ingreso:</label> <input id="f_ingreso"
									class="form-control" type="text" name="f_ingreso">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="puesto">Puesto:</label> <input id="puesto"
									class="form-control" type="text" name="puesto">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>Oficina:</label> <select class="form-control"
									name="oficina"><%=oficinas%></select>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>Jefe Inmediato:</label> <select class="form-control" name="jefe"><%=jefes%></select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="nit">Sueldo:</label>
								<div class="input-group">
									<span class="input-group-addon">$</span><input id="sueldo"
										class="form-control" type="text" name="sueldo">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Activo:</label>
								<div class="">
									<label class="radio-inline"> <input type="radio"
										name="activo" value="T" checked>Cierto
									</label> <label class="radio-inline"> <input type="radio"
										name="activo" value="F">Falso
									</label>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<input class="btn btn-primary" type="submit" value="Crear Empleado">
			</div>
		</div>
	</form>










	<%-- <form class="" action="crear.jsp" method="get" role="form">
					<fieldset>
						<legend>Información Personal</legend>
					</fieldset>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="nombres">Nombres:</label> <input id="nombres"
									class="form-control" type="text" name="nombres">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="a_paterno">Apellido Paterno:</label> <input
									id="a_paterno" class="form-control" type="text"
									name="a_paterno">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="a_materno">Apellido Materno:</label> <input
									id="a_materno" class="form-control" type="text"
									name="a_materno">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="f_nacimiento">Fecha de Nacimiento:</label> <input
									id="f_nacimiento" class="form-control" type="text"
									name="f_nacimiento">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="dui">DUI:</label> <input id="dui"
									class="form-control" type="text" name="dui"
									placeholder="99999999-9">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="nit">NIT:</label> <input id="nit"
									class="form-control" type="text" name="nit"
									placeholder="9999-999999-999-9">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="tel">Teléfono:</label> <input id="tel"
									class="form-control" type="text" name="tel"
									placeholder="99999999">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">E-mail:</label> <input id="email"
									class="form-control" type="text" name="email"
									placeholder="ejemplo@ejemplo.com">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Sexo:</label> <select class="form-control" name="sexo"><%= aux %></select>
							</div>
						</div>
					</div>
					<fieldset>
						<legend>Información del Puesto</legend>
					</fieldset>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="f_ingreso">Fecha de Ingreso:</label> <input
									id="f_ingreso" class="form-control" type="text"
									name="f_ingreso">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="oficina">Oficina:</label> <input id="oficina"
									class="form-control" type="text" name="oficina">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="puesto">Puesto:</label> <input id="puesto"
									class="form-control" type="text" name="puesto">
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="nit">Jefe Inmediato:</label> <input id="jefe"
									class="form-control" type="text" name="jefe">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="nit">Sueldo:</label>
								<div class="input-group">
									<span class="input-group-addon">$</span><input id="sueldo"
										class="form-control" type="text" name="sueldo">
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>Activo:</label>
								<div class="">
									<label class="radio-inline"> <input type="radio"
										name="activo" value="T" checked>Cierto
									</label> <label class="radio-inline"> <input type="radio"
										name="activo" value="F">Falso
									</label>
								</div>
							</div>
						</div>
					</div>
					<input class="btn btn-primary" type="submit" value="Crear Empleado">
				</form> --%>
	<!-- </div>
		</div>
	</div> -->
</body>
</html>