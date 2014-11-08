<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="dominio.Municipio"%>
<%@page import="negocio.CtrlMunicipio" %>
<%
	CtrlMunicipio ctrlMun= new CtrlMunicipio();
	
	String id_depto=request.getParameter("idDep").trim();
	List municipios = ctrlMun.daMunicipiobyDepto(id_depto);
	
	int numeroMunis = municipios.size();
	
	if (municipios.isEmpty())
		out.print("<div class='text-warning'> No Hay municipios para ese departamento</div>");
	else { 
		Municipio muniActual;
		out.print("<select>");
		for (int i = 0; i < numeroMunis; i++) {
			 muniActual = (Municipio) municipios.get(i); 
			 out.print("<option value=\""+muniActual.getId_municipio()+"\">"+muniActual.getNomb_municipio()+"</option>");
							
		}
		out.print("</select>");
	}
%>

