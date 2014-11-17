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

	for (int i = 0; i < lista.size(); i++) {
		aux = aux + "<option value=" + lista.get(i).getIdEmpleado() + ">"
				+ lista.get(i).getNombres() + " " + lista.get(i).getApellidoPaterno() + " " + lista.get(i).getApellidoMaterno() + "</option>";
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Genero</title>
</head>
<body>
	<form class="" action="CRUD_EMPLEADO/controlador_ELIMINAR.jsp" method="get" role="form">
		<div class="row">
			<div class="col-md-7">
				<fieldset>
					<legend>Eliminar Genero</legend>
					<div class="row">
						<div class="col-md-7">
							<div class="form-group">
								<label>Empleados Almacenados:</label>
								<!-- <div class="input-group"> -->
								<select data-placeholder="Elija un Genero" class="form-control" name="empleado">
									<%=aux%>
								</select>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="col-md-7">
				<input type="hidden" name="id_usuario_creador"
					value="<%=session.getAttribute("id_usuario")%>"> <input
					class="btn btn-primary" type="submit" value="Eliminar Empleado">
			</div>
		</div>
	</form>
</body>
</html>