<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page import="dominio.*" %>
<%@ page import="dao.*" %>
<%@ page import="negocio.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String fecha_ingreso = request.getParameter("fecha_ingreso");
String porcentaje_descuento = request.getParameter("porcentaje_descuento") ;
String descripcion = request.getParameter("descripcion") ;
String id_tiposdescuentos = request.getParameter("id_tiposdescuentos") ;

SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
Date date = formatter.parse(fecha_ingreso);
boolean exito=false;
String titulo=null;
String mensaje1=null;
String mensaje2=null;

CtrlTiposDescuentos CTD= new CtrlTiposDescuentos();
TiposDescuentos TD=new TiposDescuentos();

if(CTD.get(id_tiposdescuentos)==null){

	TD.setFechaIngreso(date);
TD.setPorcentajeDescuento(new BigDecimal(porcentaje_descuento.toString()));
TD.serDescripcion(descripcion);
TD.setIdTiposDescuentos(id_tiposdescuentos);

exito = CTD.guardarTipoDescuento(TD);

	if (exito) {
		titulo="Mensaje de Confirmaci&oacuten";
		mensaje1 ="Creaci&oacuten Exitosa";
		mensaje2 = "Se creo el nuevo Tipo Descuento";
	}
}
else{
	titulo="Mensaje de Error";
	mensaje1 ="Error no se pudo guardar";
	mensaje2 = "Ya hay un Tipo Descuento con el numero de id "+id_tiposdescuentos;
}




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=titulo%>></title>
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
				<h3 class="panel-title"><%=mensaje1%></h3>
			</div>

			<div class="panel" id="TiposDescuentos">
				<h3 class="panel-title text-warning"><%=mensaje2 %></h3>

				<form action="TiposDescuentosGuardar.html"><HR width="5%">
				
					<input type="submit" class="btn-primary" value="Regresar">
					
						
						
				</form>
			</div>
		</div>
	</div>
</body>
</html>