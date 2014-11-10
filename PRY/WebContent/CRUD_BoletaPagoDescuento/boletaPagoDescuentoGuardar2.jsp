<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page import="dominio.*" %>
<%@ page import="dao.*" %>
<%@ page import="negocio.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="negocio.CtrlTiposDescuentos" %>
<%@ page import="negocio.CtrlBoletaPago" %>
<%
String id_boleta_pago_descuento = request.getParameter("id_boleta_pago_descuento");
String tipo_descuento = request.getParameter("tipo_descuento") ;
String boleta_pago = request.getParameter("boleta_pago") ;
String monto_descuento = request.getParameter("monto_descuento") ;

int espacio=0;
boolean exito=false;
String titulo=null;
String mensaje1=null;
String mensaje2=null;


/// todo esto se ejecuta si se cumple la condicion
for (int n = 0; n <tipo_descuento.length (); n++){ 
	if(tipo_descuento.charAt (n)==' '){
		espacio=n;
		break;
	}
		
}
tipo_descuento=tipo_descuento.substring(0,espacio);
espacio=0;
for (int n = 0; n <boleta_pago.length (); n++){ 
	if(boleta_pago.charAt (n)==' '){
		espacio=n;
		break;
	}
		
}
boleta_pago=boleta_pago.substring(0,espacio);


CtrlTiposDescuentos CTD= new CtrlTiposDescuentos();
CtrlBoletaPago CBP=new CtrlBoletaPago();


CtrlBoletaPagoDescuento CBD=new CtrlBoletaPagoDescuento();
BoletaPagoDescuento BD=new BoletaPagoDescuento();
int id=Integer.parseInt(id_boleta_pago_descuento);
BigDecimal monto=new BigDecimal(monto_descuento);

if(CBD.get(id)==null){

BD.setIdBoletapagosdescuento(Integer.parseInt(id_boleta_pago_descuento));
BD.setTiposdescuentos(CTD.get(tipo_descuento));
BD.setBoletapago(CBP.get(Short.parseShort(boleta_pago)));
BD.setMontoDescuento(monto);



exito = CBD.guardarBoletaPagoDescuento(BD);

	if (exito) {
		titulo="Mensaje de Confirmaci&oacuten";
		mensaje1 ="Creaci&oacuten Exitosa";
		mensaje2 = "Se creo el nuevo Boleta Pago Descuento";
	}
}
else{
	titulo="Mensaje de Error";
	mensaje1 ="Error no se pudo guardar";
	mensaje2 = "Ya hay una Boleta Pago Descuento con el numero de id "+id_boleta_pago_descuento;
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

				<form action="boletaPagoDescuentoGuardar.jsp"><HR width="5%">
				<br>
				<br>
					<input type="submit" class="btn-primary" value="Regresar">
					
						
						
				</form>
			</div>
		</div>
	</div>
</body>
</html>