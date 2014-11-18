<%@ page contentType="application/vnd.ms-excel;charset=ISO-8859-1" language="java" import="java.sql.*" errorPage="" pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import = "net.sf.jasperreports.engine.JRException"%>
<%@page import = "net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import = "net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import = "net.sf.jasperreports.engine.JasperPrint"%>
<%@page import = "net.sf.jasperreports.engine.JasperReport"%>
<%@page import = "net.sf.jasperreports.engine.export.JRXlsAbstractExporterParameter"%>
<%@page import = "net.sf.jasperreports.engine.export.JRXlsExporter"%>
<%@page import = "net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>
<%@page import = "net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import = "net.sf.jasperreports.engine.export.JRPdfExporter"%>
<%@page import = "net.sf.jasperreports.engine.export.JRPdfExporterParameter"%>
  
<%
	JasperReport reporte = null;
	InputStream reportStream = getServletConfig().getServletContext().getResourceAsStream("CRUD_OFICINA/oficina.jasper");
	try {
	reporte = (JasperReport) JRLoader.loadObject(reportStream);
	} catch (JRException e) {
	e.printStackTrace();
	}
	
	
	Connection conexion;  
	Class.forName("com.mysql.jdbc.Driver"); //se carga el driver
	conexion= DriverManager.getConnection("jdbc:mysql://localhost/igf2014","root","root");
	HashMap parametros = new HashMap();
	JasperPrint print = null;
	try {
		//print = JasperFillManager.fillReport(reporte, null, conexion);
		print = JasperFillManager.fillReport(reporte, parametros, conexion);
		} catch (JRException e1) {
		e1.printStackTrace();
		}
	JRXlsExporter exportador = new JRXlsExporter();
	exportador.setParameter(JRExporterParameter.JASPER_PRINT, print);
	exportador.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,"Oficinas.xls");
	exportador.setParameter(JRExporterParameter.IGNORE_PAGE_MARGINS, true);
	exportador.setParameter(JRXlsAbstractExporterParameter.IS_WHITE_PAGE_BACKGROUND, false);
	exportador.setParameter(JRXlsAbstractExporterParameter.IS_IGNORE_CELL_BORDER, false);
	exportador.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS,true);
	exportador.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,true);
	exportador.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,true);
	exportador.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE,true);
	
	try {
		exportador.exportReport();
		} catch (JRException e) {
		e.printStackTrace();
		}
	
	
	FileInputStream entrada = new FileInputStream("Oficinas.xls");
	byte[] lectura = new byte[entrada.available()];
	entrada.read(lectura);
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition","attachment; filename=Oficinas.xls");
	response.setContentLength(lectura.length);
	response.getOutputStream().write(lectura);
	response.getOutputStream().flush();
	response.getOutputStream().close();
	entrada.close();
 

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