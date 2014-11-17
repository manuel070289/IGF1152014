<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*"%>
<%@ page import="dominio.*"%>
<%@ page import="negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	String empleadoId = request.getParameter("empleado");
	
EmpleadoDAO daoEmpleado = new EmpleadoDAO();
GeneroDAO daoGenero = new GeneroDAO();
CtrlOficina ctrlOficina = new CtrlOficina();
CtrlPuesto ctrlPuesto = new CtrlPuesto();

	Empleado empleado = daoEmpleado.daoEmpleadoById(empleadoId);

	String sexo = "";
	String oficina = "";
	String puesto = "";
	String jefe = "";

	List<Genero> lista = daoGenero.dameTodosLosGeneros();
	List<Oficina> lista2 = ctrlOficina.daoOficina();
	List<Puesto> lista3 = ctrlPuesto.daPuestoTodos();
	List<Empleado> lista4 = daoEmpleado.dameTodosLosEmpleados();

	for (int i = 0; i < lista.size(); i++) {
		sexo = sexo + "<option value=\"" + lista.get(i).getId_sexo();
		if (lista.get(i).getId_sexo().equals(empleado.getGenero().getId_sexo())) {
			sexo = sexo + "\" selected>";
		} else
			sexo = sexo + "\">";
		sexo = sexo + lista.get(i).getD_sexo() +  "</option>";
	}
	
	for (int i = 0; i < lista2.size(); i++) {
		oficina = oficina + "<option value=\"" + lista2.get(i).getId_oficina();
		if (lista2.get(i).getId_oficina().equals(empleado.getOficina().getId_oficina())) {
			oficina = oficina + "\" selected>";
		} else
			oficina = oficina + "\">";
		oficina = oficina + lista2.get(i).getNomb_oficina() +  "</option>";
	}
	
	for (int i = 0; i < lista3.size(); i++) {
		puesto = puesto + "<option value=\"" + lista3.get(i).getId_puesto();
		if (lista3.get(i).getId_puesto().equals(empleado.getPuesto().getId_puesto())) {
			puesto = puesto + "\" selected>";
		} else
			puesto = puesto + "\">";
		puesto = puesto + lista3.get(i).getNomb_puesto() +  "</option>";
	}
	
	for (int i = 0; i < lista4.size(); i++) {
		jefe = jefe + "<option value=\"" + lista4.get(i).getIdEmpleado();
		if (lista4.get(i).getIdEmpleado().equals(empleado.getIdJefe())) {
			jefe = jefe + "\" selected>";
		} else
			jefe = jefe + "\">";
		jefe = jefe + lista4.get(i).getNombres() + " " + lista4.get(i).getApellidoPaterno() + " " + lista4.get(i).getApellidoMaterno() +  "</option>";
	}	
	
	SimpleDateFormat aux = new SimpleDateFormat("dd/MM/yyyy");

	String nombre = empleado.getNombres();
	String apellido_paterno = empleado.getApellidoPaterno();
	String apellido_materno = empleado.getApellidoMaterno();
	String dui = empleado.getDui();
	String nit = empleado.getNit();
	String telefono = empleado.getTelefono();
	String email = empleado.getEmail();
	String sueldo = String.valueOf(empleado.getSueldo());
	String f_nacimiento = aux.format(empleado.getFechaNacimiento());
	String f_ingreso = aux.format(empleado.getFechaIngreso());
	
%>

<!-- <div class="row" id="dinamico_2"> -->
	<div class="col-md-12">
		<form class="" action="CRUD_EMPLEADO/controlador_ACTUALIZAR.jsp"
			method="get" role="form">
			<div class="row">
				<div class="col-md-7">
					<fieldset>
						<legend>Información Personal</legend>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label for="nombres">Nombres:</label> <input id="nombres"
										class="form-control" type="text" name="nombres"
										required="required" value="<%=nombre%>">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="a_paterno">A. Paterno:</label> <input
										id="a_paterno" class="form-control" type="text"
										name="a_paterno" required="required"
										value="<%=apellido_paterno%>">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="a_materno">A. Materno:</label> <input
										id="a_materno" class="form-control" type="text"
										name="a_materno" required="required"
										value="<%=apellido_materno%>">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="f_nacimiento">F. Nacimiento:</label> <input
										id="f_nacimiento" class="form-control" type="text"
										name="f_nacimiento" value="<%=f_nacimiento%>" required="required">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="dui">DUI:</label> <input id="dui"
										class="form-control" type="text" name="dui"
										placeholder="999999999" required="required" maxlength="9"
										value="<%=dui%>">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="nit">NIT:</label> <input id="nit"
										class="form-control" type="text" name="nit"
										placeholder="99999999999999" required="required"
										maxlength="14" value="<%=nit%>">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="tel">Teléfono:</label> <input id="tel"
										class="form-control" type="text" name="tel"
										placeholder="99999999" required="required" maxlength="8"
										value="<%=telefono%>">
								</div>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label for="email">E-mail:</label> <input id="email"
										class="form-control" type="text" name="email"
										placeholder="ejemplo@ejemplo.com" required="required"
										value="<%=email%>">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Sexo:</label> <select class="form-control" name="sexo">
										<%=sexo %>
									</select>
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
									<label for="f_ingreso">F. Ingreso:</label> <input
										id="f_ingreso" class="form-control" type="text"
										name="f_ingreso" value="<%=f_ingreso%>">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="puesto">Puesto:</label> <select class="form-control"
										name="puesto">
										<%=puesto %>
									</select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>Oficina:</label> <select class="form-control"
										name="oficina">
										<%=oficina %>
									</select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>Jefe Inmediato:</label> <select class="form-control"
										name="jefe">
										<option value="ninguno">Ninguno</option>
										<%=jefe%>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="nit">Sueldo:</label>
									<div class="input-group">
										<span class="input-group-addon">$</span><input id="sueldo"
											class="form-control" type="text" name="sueldo" value="<%=sueldo %>">
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
					<input type="hidden" name="id_usuario_creador"
						value="<%=session.getAttribute("id_usuario")%>"> <input
						class="btn btn-primary" type="submit" value="Actualizar Empleado">
				</div>
			</div>
		</form>
	</div>
<!-- </div> -->