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
	aux = "<tr><td>" + lista.get(0).getNombres() + " " + lista.get(0).getApellidoPaterno() + " " + lista.get(0).getApellidoMaterno() + "</td>"
			+ "<td>" + lista.get(0).getDui() + "</td>" 
			+ "<td>" + lista.get(0).getFechaNacimiento() 
			+ "<td>" + lista.get(0).getGenero().getD_sexo() + "</td>"
			+ "<td>" + lista.get(0).getTelefono() + "</td>"
			+ "<td>" + lista.get(0).getEmail() + "</td></tr>";
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
 </body>
 </html>