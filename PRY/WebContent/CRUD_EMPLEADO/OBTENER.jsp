<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.List"%>


<%
String aux = "";
EmpleadoDAO daoEmpleado = new EmpleadoDAO();
List<Empleado> lista = daoEmpleado.dameTodosLosEmpleados();

for(int i=0; i<lista.size();i++) {
	aux = aux + "<tr><td>" + lista.get(i).getNombres() + " " + lista.get(i).getApellidoPaterno() + " " + lista.get(i).getApellidoMaterno() + "</td>"
			+ "<td>" + lista.get(i).getDui() + "</td>" 
			+ "<td>" + lista.get(i).getFechaNacimiento() 
			+ "<td>" + lista.get(i).getGenero().getD_sexo() + "</td>"
			+ "<td>" + lista.get(i).getTelefono() + "</td>"
			+ "<td>" + lista.get(i).getEmail() + "</td></tr>";
}

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<h3>Listado de Empleados</h3>
<table class="table table-striped">
      <thead>
        <tr>
          <th>Nombre</th>
          <th>DUI</th>
          <th>F. Nacimiento</th>
          <th>Género</th>
          <th>Teléfono</th>
          <th>E-mail</th>
        </tr>
      </thead>
      <tbody>
        <%= aux %>
      </tbody>
    </table>
    <a href="CRUD_EMPLEADO/reporte_pdf_empleado.jsp" class="btn btn-primary">Exportar a PDF</a>
 </body>
 </html>