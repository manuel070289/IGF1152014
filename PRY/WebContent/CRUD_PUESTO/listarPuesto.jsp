<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.List"%>
    
<%
	String mensaje = "";
	PuestoDAO daoPuesto = new PuestoDAO();
	List<Puesto> lista = daoPuesto.daPuesto();
	
	for(int i=0; i<lista.size();i++) {
		mensaje = mensaje + "<tr><td>" + lista.get(i).getNomb_puesto() + "</td>"
				+ "<td>" + lista.get(i).getPerfil_puesto() + "</td>" 
				+ "<td>" + lista.get(i).getFecha_ing() 
				+ "<td>" + lista.get(i).getSueldo_min() + "</td>"
				+ "<td>" + lista.get(i).getSueldo_max() + "</td>"+ "</tr>";
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Listado de Puestos</h3>
<table class="table table-striped">
      <thead>
        <tr>
          <th>Nombre del Puesto</th>
          <th>Perfil del Puesto</th>
          <th>Fecha Ingreso</th>
          <th>Sueldo Minimo</th>
          <th>Sueldo Máximo</th>
        </tr>
      </thead>
      <tbody>
        <%= mensaje %>
      </tbody>
    </table>
    <a href="reportePuesto.jsp" class="btn btn-primary">Exportar a PDF</a>

</body>
</html>