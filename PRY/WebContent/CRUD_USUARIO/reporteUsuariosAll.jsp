<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="javax.servlet.*"%>
 
      
<%
    Connection conexion; 
	Class.forName("com.mysql.jdbc.Driver"); //se carga el driver 
	conexion= DriverManager.getConnection("jdbc:mysql://localhost/igf2014","root","root");

  	File reportFile = new File(application.getRealPath("CRUD_USUARIO//usuario.jasper"));

    Map parameters = new HashMap();

    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parameters,conexion);

    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
    ouputStream.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>