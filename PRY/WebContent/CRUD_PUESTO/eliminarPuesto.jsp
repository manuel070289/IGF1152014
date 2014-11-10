<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="negocio.*" %>
    <%
    String nombre = request.getParameter("nomb_puesto");
    CtrlPuesto ps = new CtrlPuesto();
    boolean exito = ps.eliminarPuesto(nombre);
    
    String mensaje="";
    if(exito){
    	mensaje = "<h2>Puesto Eliminado!</h2>";
    }
    else{
    	
    	mensaje ="<h2>Puesto no eliminado porque no se ha encontrado</h2>";
    }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar Puesto</title>
<link rel="stylesheet" type="text/css" 	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css" 	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript" 	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<%= mensaje %>
	<form class="" action="eliminarPuesto.html" method="get" role="form">
		<div class="row">
			<div class="col-md-12">
				<input class="btn btn-primary" type="submit" value="Regresar">
			</div>
		</div>
	</form>
</body>
</html>