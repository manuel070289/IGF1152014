<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%! String mensaje = "" ; %>
<%
	CtrlOficina catalogo = new CtrlOficina();
	List oficinas = catalogo.daoOficina();
	int numOficinas = oficinas.size();
	if (oficinas.isEmpty())
		mensaje += "<div class='text-warning'> No Hay Oficinas</div>";
	else
	{
		Oficina ofiActual;	
		mensaje += "<select required name='id_oficina'  onchange='cargarOfi(this.value);'>"+
	 			"<option value=''>Seleccione</option>";
		for (int i=0; i < numOficinas; i++) {
			 ofiActual = (Oficina) oficinas.get(i);
				mensaje += "<option value=' " + ofiActual.getId_oficina() + "'> " + ofiActual.getNomb_oficina()+"</option>";	
		 }
		mensaje += "</select>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Oficina</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../JS/ajax.js"></script>
</head>
<body>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-7">
			<form class="" action="actualizarOfic.jsp" method="post" role="form">
				<fieldset>
					<legend>ACTUALIZAR OFICINA</legend>
				</fieldset>
				<%=mensaje %>
				<br>
				<div name="divOficina" id="divOficina">
				</div>
				<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
				
			</form>
		</div>
		<%=mensaje=""%>
	</div>
</div>



</body>
</html>