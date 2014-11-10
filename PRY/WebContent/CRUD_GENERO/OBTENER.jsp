<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*"%>
<%@ page import="dominio.*"%>
<%@ page import="java.util.List"%>


<%
String aux = "";
GeneroDAO daoGenero = new GeneroDAO();
List<Genero> lista = daoGenero.dameTodosLosGeneros();

for(int i=0; i<lista.size();i++) {
	aux = aux + "<tr><td>" + lista.get(i).getId_sexo() + "</td>" + "<td>" + lista.get(i).getD_sexo() + "</td></tr>";
}

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<h3>Listado de Generos</h3>
<table class="table table-striped">
      <thead>
        <tr>
          <th>Id</th>
          <th>Descripción</th>
        </tr>
      </thead>
      <tbody>
        <%= aux %>
      </tbody>
    </table>
 </body>
 </html>