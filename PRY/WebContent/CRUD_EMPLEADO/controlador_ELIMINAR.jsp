<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%!String mensaje = "";%>
<%
	CtrlEmpleado ctrlEmpleado = new CtrlEmpleado();

	String empleado = request.getParameter("empleado");
	String id_usuario=request.getParameter("id_usuario_creador").trim();

	if (ctrlEmpleado.eliminarEmpleado(empleado, id_usuario, Short.parseShort("0")) != false )
		mensaje += "Empleado Dado de Baja";
	else
		mensaje += "Error en la eliminación";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<%=mensaje = ""%>
</body>
<!-- <script>
	function redireccionar() {
		window.location = "../menu.jsp";
	}
	setTimeout("redireccionar()", 2000);
</script> -->
</html>