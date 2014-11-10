<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%
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

</body>
</html>