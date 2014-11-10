<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%!String mensaje = "";%>
<%
	CtrlUsuario ctrlUsuario= new CtrlUsuario();
	Short id_user=Short.parseShort(request.getParameter("id_usu"));
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String genero=request.getParameter("genero");
	String username=request.getParameter("username");
	String passwd=request.getParameter("passwd");
	Short rol=Short.parseShort(request.getParameter("rol"));
	
	CtrlGenero gen = new CtrlGenero();
	Genero gene=gen.daGeneroById(genero);
	
	if(ctrlUsuario.modificarUsuario(id_user, nombre, apellido, gene, username,passwd,rol)!=false)
		mensaje+="Usuario Actualizado"; 
	else
		mensaje+="Error en la Actualización";
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Usuario</title>
</head>
<body>
<div class='container-fluid '>
		<div class="row">
			<div class="col-md-7">
				<fieldset>
						<legend>Información</legend>
						<%=mensaje%>
					</fieldset>
			</div>
		</div>
	</div>
	<%=mensaje=""%>
</body>
</html>
<script>
function redireccionar(){window.location="../menu.jsp";}
setTimeout ("redireccionar()", 2000);
</script>