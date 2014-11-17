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
Short id_usuario = Short.valueOf(request.getParameter("id_usuario_creador").trim());


String id_boleta_pago_descuento = request.getParameter("id_boleta_pago_descuento");
String tipo_descuento = request.getParameter("tipo_descuento") ;
String boleta_pago = request.getParameter("boleta_pago") ;


int espacio=0;
boolean exito=false;
String titulo=null;
String mensaje1=null;
String mensaje2=null;
Date fecha=new Date();
int activo=1; //esto para crear el nuevo registro de forma activa


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
BigDecimal monto=CBP.get(Short.parseShort(boleta_pago)).getSueldoPago();
BigDecimal descuento=CTD.get(tipo_descuento).getPorcentajeDescuento();

//calcular momto descuento
monto=monto.multiply(descuento.divide(new BigDecimal("100")));
String tipo=""+CTD.get(tipo_descuento).getPorcentajeDescuento().floatValue()+"%";
String montos="$"+CBP.get(Short.parseShort(boleta_pago)).getSueldoPago().floatValue(); 

if(CBD.get(id)==null){

BD.setIdBoletapagosdescuento(Integer.parseInt(id_boleta_pago_descuento));
BD.setTiposdescuentos(CTD.get(tipo_descuento));
BD.setBoletapago(CBP.get(Short.parseShort(boleta_pago)));
BD.setMontoDescuento(monto);
BD.setFechaCreacion(fecha);
BD.setFechaModifica(fecha);
BD.setUsuarioCreador(id_usuario.intValue());
BD.setUsuarioModifica(id_usuario.intValue());
BD.setActivo(activo);



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
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<table>
<tr><td>Id Boleta Pago Descuento:</td><td><input type="text" name="id_boleta_pago_descuento" value=<%=id_boleta_pago_descuento%> readonly="readonly"></td></tr>
							     
<tr><td>Porcentaje Descuento:</td><td> <input style=" width:175px" type="text" name="tipo" value=<%=tipo%> readonly="readonly">						
<tr><td>Salario Boleta Pago:</td><td>	<input style=" width:175px" type="text"  name="boleta" value=<%=montos%> readonly="readonly"> 
<tr><td>Monto Descuento:          $</td><td><input type="text" name="monto_descuento" value=<%=monto.doubleValue()%> readonly="readonly"></td></tr>
</table>
<br>
<br>
				
		
				<input type="submit" class="btn-primary" value="Regresar">
					
						
						
				</form>
			</div>
		</div>
	</div>
</body>
</html>