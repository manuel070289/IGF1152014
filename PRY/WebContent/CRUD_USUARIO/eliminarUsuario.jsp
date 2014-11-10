<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%! String mensaje = "" ; %>
<%
	CtrlUsuario ctrlUsuario = new CtrlUsuario();
	List usuarios = ctrlUsuario.daoUsuario();
	int numUsuarios = usuarios.size();
	if (usuarios.isEmpty())
		mensaje += "<div class='text-warning'> No Hay Usuarios</div>";
	else
	{
		Usuario usuActual;	
		mensaje += "<select required name='id_usu'  onchange='cargarUsu(this.value,2);'>"+
	 			"<option value=''>Seleccione</option>";
		for (int i=0; i < numUsuarios; i++) {
			usuActual = (Usuario) usuarios.get(i);
				mensaje += "<option value='" + usuActual.getId_usuario()+ "'> " + usuActual.getNombre()+" "+usuActual.getApellido()+"</option>";	
		 }
		mensaje += "</select>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar Usuario</title>
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
			<form class="" action="eliminarUsua.jsp" method="post" role="form">
				<fieldset>
					<legend>ELIMINAR USUARIO</legend>
				</fieldset>
				<div class="form-group">
					<label for="departamento">Seleccione el Usuario:</label>
					<%=mensaje %>
				</div>
				<br>
				<div class="panel panel-default">
					<div class="panel-body" name="divUsuario" id="divUsuario">
					Detalles de Usuario
					</div>
				</div>
				<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
				
			</form>
		</div>
		<%=mensaje=""%>
	</div>
</div>



</body>
</html>