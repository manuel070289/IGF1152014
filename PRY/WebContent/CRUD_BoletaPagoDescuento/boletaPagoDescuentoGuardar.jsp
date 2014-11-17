<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="negocio.CtrlTiposDescuentos" %>
<%@ page import="negocio.CtrlBoletaPago" %>
<%@ page import="negocio.CtrlBoletaPagoDescuento" %>
<%@ page import="dominio.TiposDescuentos" %>
<%@ page import="dominio.BoletaPago" %>
<%@ page import="dominio.BoletaPagoDescuento" %>
<%@ page import="java.util.List"%>
<%
CtrlTiposDescuentos TD=new CtrlTiposDescuentos();
List<TiposDescuentos> lista=TD.buscarTodos();

CtrlBoletaPago BP=new CtrlBoletaPago();
List<BoletaPago> listaBP=BP.buscarTodos();

CtrlBoletaPagoDescuento CBPD= new CtrlBoletaPagoDescuento();
List<BoletaPagoDescuento> listaBPD=CBPD.buscarTodos();
int contador=0;
if(listaBPD!=null)			               
for(BoletaPagoDescuento Tipos:listaBPD){
	contador++;
}
contador++;//nuevo id si repetir de la base de datos

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nueva Boleta Pago Descuento</title>
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
			<h3 class="panel-title text-warning">Nueva Boleta Pago Descuento</h3>
				<form action="boletaPagoDescuentoGuardar2.jsp" method="post"><HR width="5%">
<table>
<tr><td>Id Boleta Pago Descuento:</td><td><input type="text" name="id_boleta_pago_descuento" value=<%=contador%> readonly="readonly"></td></tr>
<tr><td>Seleccione Tipo Descuento:</td><td> <select id="tipo_descuento" name="tipo_descuento">
<option>Select Tipo Descuento.</option>
<% 
if(lista!=null)			               
for(TiposDescuentos TiposDesc:lista){%> 
<option><%=TiposDesc.getIdTiposdescuentos()%> <%=TiposDesc.getPorcentajeDescuento().doubleValue()%>%</option>
<%} %>>
</select>	</tr></td>

<tr><td>Seleccione la Boleta Pago:</td><td> <select  style=" width:175px" id="boleta_pago" name="boleta_pago">
<option>Select la Boleta Pago .</option>
<% 
if(listaBP!=null)			               
for(BoletaPago BoletaP:listaBP){%> 
<option><%=BoletaP.getIdBoletapago()%> Sueldo: $<%=BoletaP.getSueldoPago()%></option>
<%} %>>
</select>	</tr></td>
<tr><td>Monto Descuento:</td><td><input type="text" name="monto_descuento"  readonly="readonly"></td></tr>
</table>
<br>
<br>		
<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">	
<input type="submit" class="btn-primary" value="Guardar">
					
			
						
						
				</form>
			</div>
		</div>
	</div>






</select>
</body>
</html>