<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%!String mensaje = "";%>
<%
	String nomb=request.getParameter("nomb_oficina").trim();
	String munic=request.getParameter("municipio").trim();
	String domic=request.getParameter("domicilio").trim();
	String id_usuario=request.getParameter("id_usuario_creador").trim();
	
	CtrlMunicipio mun=new CtrlMunicipio();
	Municipio municipio=mun.daMunicipioById(munic);
	 
	CtrlOficina ofic=new CtrlOficina();
	if(ofic.crearOficina(nomb,domic,municipio,id_usuario))
		mensaje+="Oficina creada con exito";
	else
		mensaje+="Error";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class='container-fluid '>
		<div class="row">
			<div class="col-md-7">
				<fieldset>
						<legend>Informacion</legend>
						<%=mensaje%>
					</fieldset>
			
			
			</div>
		</div>
	</div>
</body>
</html>