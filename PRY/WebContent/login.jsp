<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="negocio.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.BigDecimal"%>
<%
	CtrlUsuario ctrlUsuario= new CtrlUsuario();
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	String mensaje="";
	
	Usuario usuario=ctrlUsuario.daoUsuarioByUserPass(user, pass); 
	if(usuario==null || usuario.getActivo()==0)
	{
		mensaje+="Error de Autenticación";
	}
	else
	{
		session.setAttribute("rol", usuario.getRol());
		session.setAttribute("id_usuario", usuario.getId_usuario());
		String site = new String("menu.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
</head>
<body>
<%=mensaje %>
</body>
</html>