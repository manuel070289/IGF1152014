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

	
	if(ctrlUsuario.eliminarUsuario(id_user)!=false)
		mensaje+="Usuario Eliminado"; 
	else
		mensaje+="Error en la Eliminación";
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar Usuario</title>
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