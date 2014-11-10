<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>

<%! String mensaje = "" ; %>
<%
	
     CtrlMunicipio nomina = new CtrlMunicipio();
 	 List municipios = nomina.daMunicipioActivos();
	 int numeroDeptos = municipios.size();
	 
				
 	 if (municipios.isEmpty())
 		mensaje += "<div class='text-warning'> No Hay Departamentos</div>";
 	 else {
 		 Municipio muniActual;
 		mensaje += "<select required name='municipio'  >"+
 		 			"<option value=''>Seleccione</option>";
 		 
 		 for (int i=0; i < numeroDeptos; i++) {
 			 muniActual = (Municipio) municipios.get(i);
 			mensaje += "<option value=' " + muniActual.getId_municipio() + "'> " + muniActual.getNomb_municipio()+"</option>";
					
 		 }
 		 mensaje += "</select>";
 	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dar Baja Municipio</title>
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap-3.2.0-dist/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<form class="" action="DarBaja.jsp" method="post" role="form">
					<fieldset>
						<legend>DAR BAJA A MUNICIPIO</legend>
					</fieldset>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<label for="nombres">Seleccione el municipio:</label>
								<%=mensaje %>
							</div>
						</div>						
					</div>
					<input type="hidden" name="id_usuario_creador" value="<%=session.getAttribute("id_usuario") %>">
					<input class="btn btn-primary" type="submit" value="Dar Baja">
				</form>
			</div>
			<%=mensaje=""%>
		</div>
	</div>
</body>
</html>