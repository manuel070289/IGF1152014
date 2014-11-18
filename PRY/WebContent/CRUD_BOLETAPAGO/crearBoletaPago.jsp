<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%
	String mensaje = "";
	EmpleadoDAO daoEmpleado = new EmpleadoDAO();
	List<Empleado> listaEmpleados = daoEmpleado.dameTodosLosEmpleados();
	
	int numEmpleados = listaEmpleados.size();
	if (listaEmpleados.isEmpty())
		mensaje += "<div class='text-warning'> No Hay Empleados</div>";
	else {
		Empleado empleadoActual;
		mensaje += "<select required name='idempleado' onchange='cargarEmpleado(this.value);'>"
				+ "<option value=''>Seleccione</option>";
		for (int i = 0; i < numEmpleados; i++) {
			empleadoActual = (Empleado) listaEmpleados.get(i);
			mensaje += "<option value=' " + empleadoActual.getIdEmpleado()
					+ "'> " + empleadoActual.getNombres() + "</option>";
		}
		mensaje += "</select>";
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Boleta de Pago</title>
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
				<form class="" action="actualizaPuesto.jsp" method="post" role="form">
					<fieldset>
						<legend>Crear Boleta Pago</legend>
					</fieldset>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label for="nombres">Periodo de Pago:</label> 
									<select id="nvo_puesto" class="form-control"  name="p_pago">
										<option value ="quincenal">Quincenal</option>
										<option value ="mensual">Mensual</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
							<div class="form-group">
								<label>Elija un empleado:</label> 
								<%=mensaje%>
							</div>
						</div>
						</div>
						<div class="row">
						<div class="col-md-12">
							<input type="hidden" name="id_usuario_creador"
								value="<%=session.getAttribute("id_usuario")%>"> <input
								class="btn btn-primary" type="submit" value="Crear Boleta Pago">
						</div>
					</div>
				</form>
			</div>
				<%=mensaje=""%>
		</div>
	</div>
</body>
</html>