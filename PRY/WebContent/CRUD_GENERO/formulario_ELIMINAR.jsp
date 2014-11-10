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
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Genero</title>
</head>
<body>
	<form class="" action="CRUD_GENERO/controlador_ELIMINAR.jsp" method="get" role="form">
		<div class="row">
			<div class="col-md-7">
				<fieldset>
					<legend>Eliminar Genero</legend>
					<div class="row">
						<div class="col-md-7">
							<div class="form-group">
								<label>Generos Almacenados:</label>
								<!-- <div class="input-group"> -->
								<select data-placeholder="Elija un Genero" class="form-control" name="genero">
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
					class="btn btn-primary" type="submit" value="Eliminar Género">
			</div>
		</div>
	</form>
</body>
</html>