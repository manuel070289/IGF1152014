<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="dominio.*"%>
<%@page import="negocio.*" %>
<%
	CtrlOficina ctrlOfi= new CtrlOficina();
	CtrlMunicipio ctrlMun= new CtrlMunicipio();
	CtrlDepartamento ctrlDep=new CtrlDepartamento();
	
	String id_oficina=request.getParameter("idOfi").trim();
	Oficina oficina = ctrlOfi.daoOficinaById(id_oficina);
	
	if (oficina==null)
	{
		out.print("<div class='text-warning'>Error</div>");
	}
	else { 
		
		Municipio municipio= oficina.getMunicipio();
		Departamento departamento=municipio.getDepartamento();
		
		List departamentos = ctrlDep.daDepartamentos();
		int numeroDeptos = departamentos.size();
				
		Departamento depActual;
		out.print("<div class='col-sm-7'>"
					+"<div class='form-group'>"
					+"<label for='departamento'>Seleccione el departamento:</label>");
		
		out.print("<select required name='departamento'  onchange='cargarMun(this.value);'>");
		out.print("<option value=''>Seleccione</option>");
		for (int i=0; i < numeroDeptos; i++) {
			depActual = (Departamento) departamentos.get(i);
			if(depActual.getId_depto().equals(departamento.getId_depto()))
				out.print("<option value='" + depActual.getId_depto() + "' selected> " + depActual.getNombre_depto()+"</option>");
			else
				out.print("<option value='" + depActual.getId_depto() + "'> " + depActual.getNombre_depto()+"</option>");
		}
		out.print("</select>");
		out.print("</div></div>");
		
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		out.print("<label for='municipio'>Seleccione el municipio:</label>");
		out.print("<div id='muni' name='muni'>");
		
		List municipios = ctrlMun.daMunicipios();
		int numeroMuni = departamentos.size();
				
		Municipio munActual;
		out.print("<select required name='municipio'>");
		out.print("<option value=''>Seleccione</option>");
		for (int i=0; i < numeroDeptos; i++) {
			munActual = (Municipio) municipios.get(i);
			if(munActual.getId_municipio().equals(municipio.getId_municipio()))
				out.print("<option value=' " + munActual.getId_municipio() + "' selected> " + munActual.getNomb_municipio()+"</option>");
			else
				out.print("<option value=' " + munActual.getId_municipio() + "'> " + munActual.getNomb_municipio()+"</option>");
		}
		out.print("</select>");
		
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		out.print("<label for='domicilio'>Domicilio de la Oficina:</label>");
		out.print("<input id='domicilio' class='form-control' type='text' name='domicilio' value='"+oficina.getDomicilio()+"' required>");
		out.print("</div>");
		out.print("</div>");
		
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		out.print("<label for='nomb_oficina'>Nombre de la Oficina:</label>");
		out.print("<input id='nomb_oficina' class='form-control' type='text' name='nomb_oficina' value='"+oficina.getNomb_oficina()+"' required>");
		out.print("</div>");
		out.print("</div>");
		
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		out.print("<input class='btn btn-primary' type='submit' value='Actualizar Oficina'>");
		out.print("</div>");
		out.print("</div>");

	}
%>