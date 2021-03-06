<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.List"%>

<%
String aux = "";
EmpleadoDAO daoEmpleado = new EmpleadoDAO();
List<Empleado> lista = daoEmpleado.dameTodosLosEmpleados();

for(int i=0; i<lista.size();i++) {
	aux = aux + "<option value=" + lista.get(i).getIdEmpleado() + ">" + lista.get(i).getNombres() + " " 
+ lista.get(i).getApellidoPaterno() + lista.get(i).getApellidoMaterno() + "</option>";
}

String oficinas = "";
OficinaDAO daoOficina = new OficinaDAO();
List<Oficina> listaOficina = daoOficina.daoOficina();
for (int i = 0; i < listaOficina.size(); i++) {
	oficinas = oficinas + "<option value="
			+ listaOficina.get(i).getId_oficina() + ">"
			+ listaOficina.get(i).getNomb_oficina() + "</option>";
}

String puestos = "";
PuestoDAO daoPuesto = new PuestoDAO();
List<Puesto> listaPuestos = daoPuesto.daPuesto();
for (int i = 0; i < listaPuestos.size(); i++) {
	puestos = puestos + "<option value="
			+ listaPuestos.get(i).getId_puesto() + ">"
			+ listaPuestos.get(i).getNomb_puesto() + " "
			+ "</option>";
}

String genero = "";
GeneroDAO daoGenero = new GeneroDAO();
List<Genero> listaGenero = daoGenero.dameTodosLosGeneros();
for (int i = 0; i < listaGenero.size(); i++) {
	genero = genero + "<option value=" + listaGenero.get(i).getId_sexo() + ">"
			+ listaGenero.get(i).getD_sexo() + "</option>";
}

%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Genero</title>
</head>
<body>
	<div class="row">
		<div class="col-md-7">
			<form id="1" class="" action="CRUD_EMPLEADO/empleado_info.jsp" method="get"
				role="form">
				<fieldset>
					<legend>Actualizar Datos de Empleado</legend>
					<div class="row">
						<div class="col-md-9">
							<div class="form-group">
								<label for="nombres">Empleado:</label>
								<div class="input-group">
									<select data-placeholder="Elija un Empleado"
										class="chosen-select form-control" name="empleado">
										<%= aux %>
									</select> <span class="input-group-btn">
										<button id="btnMostrar" class="btn btn-default" type="button">Mostrar</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="row" id="dinamico_2">
		<div class="col-md-12">
			<form class="" action="CRUD_EMPLEADO/controlador_ACTUALIZAR.jsp" method="get"
		role="form">
		<div class="row">
			<div class="col-md-7">
				<fieldset>
					<legend>Informaci�n Personal</legend>
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
									placeholder="999999999" required="required" maxlength="9">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="nit">NIT:</label> <input id="nit"
									class="form-control" type="text" name="nit"
									placeholder="99999999999999" required="required" maxlength="14">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="tel">Tel�fono:</label> <input id="tel"
									class="form-control" type="text" name="tel"
									placeholder="99999999" required="required" maxlength="8">
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
								<label>Sexo:</label> <select class="form-control" name="sexo"><%=genero%></select>
							</div>
						</div>
					</div>
				</fieldset>

			</div>
			<div class="col-md-5">
				<fieldset>
					<legend>Informaci�n del Puesto</legend>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="f_ingreso">F. Ingreso:</label> <input id="f_ingreso"
									class="form-control" type="text" name="f_ingreso">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="puesto">Puesto:</label> <select class="form-control"
									name="puesto" required="required"><%=puestos%></select>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>Oficina:</label> <select class="form-control"
									name="oficina" required="required"><%=oficinas%></select>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>Jefe Inmediato:</label> <select class="form-control" name="jefe">
								<option value="ninguno">Ninguno</option>
								<%=aux%></select>
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
			<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
				<input class="btn btn-primary" type="submit" value="Actualizar Empleado">
			</div>
		</div>
	</form>
		</div>
	</div>
</body>
</html>