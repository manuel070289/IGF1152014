<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>

<%!String mensaje = "";%>
<%
	String nombre = request.getParameter("nombre").trim();
	String apellido = request.getParameter("apellido").trim();
	String genero = request.getParameter("genero").trim();
	String user = request.getParameter("username").trim();
	String pass = request.getParameter("passwd").trim();
	String rol = request.getParameter("rol").trim();
	
	CtrlGenero gen = new CtrlGenero();
	Genero gene;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class='panel container-fluid col-xs-7'>
		<div class='panel panel-primary '>
			<div class='panel-heading'>
				<h3 class='title'>Informacion</h3>
			</div>

			<%=mensaje%>
		</div>
	</div>
	<%=mensaje=""%>a
</body>
</html>