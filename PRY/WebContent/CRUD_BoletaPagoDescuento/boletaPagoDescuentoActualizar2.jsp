<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dao.*" %>
<%@ page import="negocio.CtrlBoletaPagoDescuento"%>
<%@ page import="negocio.CtrlTiposDescuentos"%>
<%@ page import="negocio.CtrlBoletaPago"%>
<%@ page import="dominio.TiposDescuentos"%>
<%@ page import="dominio.BoletaPago"%>
<%@ page import="java.util.List"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
CtrlBoletaPagoDescuento CBPD= new CtrlBoletaPagoDescuento();
int espacio=0;
int idBPD=0;

int id_BPD=0;
BigDecimal monto=new BigDecimal("0.0");


CtrlTiposDescuentos TD=new CtrlTiposDescuentos();
List<TiposDescuentos> lista=null;

CtrlBoletaPago BP=new CtrlBoletaPago();
List<BoletaPago> listaBP=null;

String id = request.getParameter("usuariosSelect");
String mensaje="";
if(id.equals("Seleccione la Boleta Pago Descuento")){
	mensaje="Debe elegir la boleta de pago descuento regrese al men&uacute anterior";
}
else	
{


for (int n = 0; n <id.length (); n++){ 
	if(id.charAt (n)==' '){
		espacio=n;
		break;
	}
		
}
id=id.substring(0,espacio);
idBPD=Integer.parseInt(id);

lista=TD.buscarTodos();
listaBP=BP.buscarTodos();

id_BPD=CBPD.get(idBPD).getIdBoletapagosdescuento();
monto=CBPD.get(idBPD).getMontoDescuento();

}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Boleta Pago Descuento</title>
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
				<h3 class="panel-title">Boleta Pago Descuento</h3>
			</div>

			<div class="panel" id="BoletaPagoDescuento">
				<h3 class="panel-title text-warning">Actualizar Boleta Pago Descuento</h3>
				<font color="red"><%=mensaje %></font>

				<form action="boletaPagoDescuentoActualizar3.jsp" method="post"><HR width="5%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<table>
<tr><td>id Boleta Pago Descuento:</td><td><input style=" width:175px" type="text" name="id_boleta_pago_descuento" value=<%=id_BPD%> readonly="readonly"></td></tr>
<tr><td>Seleccione Tipo Descuento:</td><td> <select  style=" width:175px" id="tipo_descuento" name="tipo_descuento">
<option>Select Tipo Descuento.</option>
<% 
if(lista!=null)			               
for(TiposDescuentos TiposDesc:lista){%> 
<option><%=TiposDesc.getIdTiposdescuentos()%> <%=TiposDesc.getPorcentajeDescuento().doubleValue()%>%</option>
<%} %>>
</select>	</tr></td>

<tr><td>Seleccione la Boleta Pago:</td><td> <select  style=" width:175px" id="boleta_pago" name="boleta_pago" >
<option>Select la Boleta Pago .</option>
<% 
if(listaBP!=null)			               
for(BoletaPago BoletaP:listaBP){%> 
<option><%=BoletaP.getIdBoletapago()%> Sueldo: $<%=BoletaP.getSueldoPago()%></option>
<%} %>>
</select>	</tr></td>
<tr><td>Edite el Monto Descuento:</td><td><input  style=" width:175px" type="text" name="monto_descuento" value=<%=monto%>></td></tr>
</table>
<br>
<br>		
<input type="submit" class="btn-primary" value="Actualizar">
					
			
						
						
				</form>
			</div>
		</div>
	</div>






</select>
</body>
</html>