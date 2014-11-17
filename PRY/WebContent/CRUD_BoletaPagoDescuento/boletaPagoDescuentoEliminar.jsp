<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="dao.TiposDescuentosDAO" %>
<%@ page import="negocio.CtrlBoletaPagoDescuento" %>
<%@ page import="dominio.BoletaPagoDescuento" %>
<%@ page import="java.util.List"%>
<%
CtrlBoletaPagoDescuento CBPD=new CtrlBoletaPagoDescuento();
List<BoletaPagoDescuento> lista=CBPD.buscarTodos();




%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar Boleta Pago Descuento</title>
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
				<h3 class="panel-title text-warning">Eliminar Boleta Pago Descuento</h3>

				<form action="boletaPagoDescuentoEliminar2.jsp" method="post"><HR width="5%">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<br>                 
Seleccione el Registro que Desea Eliminar: <select id="usuariosSelect" name="usuariosSelect">
<option>Seleccione la Boleta Pago Descuento</option>
<% 
if(lista!=null)			               
for(BoletaPagoDescuento BP:lista){%> 
<option><%=BP.getIdBoletapagosdescuento()%> Monto: $<%=BP.getMontoDescuento().doubleValue()%></option>
<%} %>>
</select>	
<br>
<br>	
<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">	
<input type="submit" class="btn-primary" value="Eliminar">
					
			
						
						
				</form>
			</div>
		</div>
	</div>






</select>
</body>
</html>