<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page import="dominio.*" %>
<%@ page import="dao.*" %>
<%@ page import="negocio.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

String id_tiposdescuentos = request.getParameter("id_tiposdescuentos") ;

CtrlTiposDescuentos CTD= new CtrlTiposDescuentos();

boolean exito = CTD.eliminarTipoDescuento(id_tiposdescuentos);

String mensaje;

if (exito) {
	mensaje = "Se actualiz&oacute el tipo descuento";
}else {
	mensaje = "No se actualiz&oacute el  tipo descuento";
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mensaje de Confirmaci&oacuten</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel container-fluid col-xs-7">
		<div class="panel panel-primary ">
			<div class="panel-heading" data-toggle="collapse"
				data-target="#crud_tiposdescuentos" data-parent="#menu_izq">
				<h3 class="panel-title">Eliminaci&oacuten Exitosa</h3>
			</div>

			<div class="panel" id="TiposDescuentos">
				<h3 class="panel-title text-warning">Se ha borrado el Tipo Descuento</h3>

				<form action="TiposDescuentosEliminar.jsp"><HR width="5%">
				
					<input type="submit" class="btn-primary" value="Regresar">
					<%=mensaje %>
						
				</form>
			</div>
		</div>
	</div>


</body>
</html>