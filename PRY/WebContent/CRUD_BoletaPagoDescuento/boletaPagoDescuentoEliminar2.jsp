<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page import="dominio.*" %>
<%@ page import="dao.*" %>
<%@ page import="negocio.CtrlBoletaPagoDescuento"%>
<%@ page import="java.util.List"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
//Short id_usuario = Short.valueOf(request.getParameter("id_usuario_creador").trim());
Short id_usuario = 1;
String id = request.getParameter("usuariosSelect");
int espacio=0;
int idBPD=0;
String mensaje1="";
String mensaje2="";
String titulo="";
if(id.equals("Seleccione la Boleta Pago Descuento")){
	titulo="Mensaje de Error";
	mensaje1 ="Error no se puede eliminar";
	mensaje2 = "Debe Elegir un registro primero presione regresar";

}
else
{
	//aqui todo bien se ejecuta la eliminación
for (int n = 0; n <id.length (); n++){ 
	if(id.charAt (n)==' '){
		espacio=n;
		break;
	}
		
}
id=id.substring(0,espacio);
idBPD=Integer.parseInt(id);

Date fechaActual=new Date();
CtrlBoletaPagoDescuento CBPD= new CtrlBoletaPagoDescuento();
BoletaPagoDescuento modificar=CBPD.get(idBPD);

modificar.setActivo(0);
modificar.setFechaModifica(fechaActual);
modificar.setUsuarioModifica(id_usuario.intValue());


boolean exito = CBPD.actualizarBoletaPagoDescuento(modificar);
//boolean exito = CBPD.eliminarBoletaPagoDescuento(idBPD);



if (exito) {
	titulo="Mensaje de Confirmaci&oacuten";
	mensaje1 ="Eliminaci&oacuten Exitosa";
	mensaje2 = "Se ha Borrado la Boleta Pago Descuento";
}else {
	titulo="Mensaje de Error";
	mensaje1 ="Error no se puede eliminar";
	mensaje2 = "Debe Elegir un registro primero presione regresar";
}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=titulo %></title>
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
				data-target="#crud_boletapagodescuento" data-parent="#menu_izq">
				<h3 class="panel-title"><%=mensaje1 %></h3>
			</div>

			<div class="panel" id="TiposDescuentos">
				<h3 class="panel-title text-warning"><%=mensaje2%></h3>

				<form action="boletaPagoDescuentoEliminar.jsp"><HR width="5%">
					<br>
					<br>
					<input type="submit" class="btn-primary" value="Regresar">
					
						
				</form>
			</div>
		</div>
	</div>


</body>
</html>