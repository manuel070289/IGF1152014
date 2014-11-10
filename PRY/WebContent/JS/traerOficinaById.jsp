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
	Integer accion=Integer.parseInt(request.getParameter("accion").trim());
	Oficina oficina = ctrlOfi.daoOficinaById(id_oficina);
	
	if (oficina==null)
	{
		out.print("Descripción de la Oficina");
	}
	else { 
		 
		/*Municipio municipio= oficina.getMunicipio();
		Departamento departamento=municipio.getDepartamento();*/
		List departamentos = ctrlDep.daDepartamentos();
		int numeroDeptos = departamentos.size();
		
	
		out.print("<div class='col-sm-7'>"
				+"<div class='form-group'>"
				+"<label for='departamento'>Departamento:</label>");
		if(accion==1)
		{
			Departamento depActual;
			out.print("<label for='departamento'>Seleccione el departamento:</label>");
			
			out.print("<select required name='departamento'  id='departamento' onchange='cargarMun(this.value);'>");
			out.print("<option value=''>Seleccione</option>");
			for (int i=0; i < numeroDeptos; i++) {
				depActual = (Departamento) departamentos.get(i);
				if(depActual.getId_depto().equals(oficina.getMunicipio().getDepartamento().getId_depto()))
					out.print("<option value='" + depActual.getId_depto() + "' selected> " + depActual.getNombre_depto()+"</option>");
				else
					out.print("<option value='" + depActual.getId_depto() + "'> " + depActual.getNombre_depto()+"</option>");
			}
			out.print("</select>");
		}
		if(accion==2)
			out.print("<input id='departamento' class='form-control' type='text' name='departamento' disabled value='"+oficina.getMunicipio().getDepartamento().getNombre_depto()+"' required>");
		
		out.print("</div></div>");
		
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		
		
		
				
		if(accion==1)
		{
			out.print("<label for='municipio'>Seleccione el municipio:</label>");
			out.print("<div id='muni' name='muni'>");
			List municipios = ctrlMun.daMunicipiobyDepto(oficina.getMunicipio().getDepartamento().getId_depto());
			int numeroMuni = municipios.size();
			Municipio munActual;
			out.print("<select required name='municipio' id='municipio'>");
			out.print("<option value=''>Seleccione</option>");
			for (int i=0; i < numeroMuni; i++) {
				munActual = (Municipio) municipios.get(i);
				if(munActual.getId_municipio().equals(oficina.getMunicipio().getId_municipio()))
					out.print("<option value='" + munActual.getId_municipio() + "' selected> " + munActual.getNomb_municipio()+"</option>");
				else
					out.print("<option value='" + munActual.getId_municipio() + "'> " + munActual.getNomb_municipio()+"</option>");
			}
			out.print("</select>");
		}
		if(accion==2)
		{
			out.print("<label for='municipio'>Municipio:</label>");
			out.print("<div id='muni' name='muni'>");
			out.print("<input id='municipio' class='form-control' type='text' name='municipio' disabled value='"+oficina.getMunicipio().getNomb_municipio()+"'>");
		}
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		out.print("<label for='domicilio'>Domicilio de la Oficina:</label>");
		if(accion==1)
			out.print("<input id='domicilio' class='form-control' type='text' name='domicilio' value='"+oficina.getDomicilio()+"' required>");
		if(accion==2)
			out.print("<input id='domicilio' class='form-control' type='text' name='domicilio' disabled value='"+oficina.getDomicilio()+"' required>");
		out.print("</div>");
		out.print("</div>");
		
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		out.print("<label for='nomb_oficina'>Nombre de la Oficina:</label>");
		if(accion==1)
			out.print("<input id='nomb_oficina' class='form-control' type='text' name='nomb_oficina' value='"+oficina.getNomb_oficina()+"' required>");
		if(accion==2)
			out.print("<input id='nomb_oficina' class='form-control' type='text' disabled name='nomb_oficina' value='"+oficina.getNomb_oficina()+"' required>");
		out.print("</div>");
		out.print("</div>");
		
		out.print("<div class='col-sm-7'>");
		out.print("<div class='form-group'>");
		if(accion==1)
			out.print("<input class='btn btn-primary' type='submit' value='Actualizar Oficina'>");
		if(accion==2)
			out.print("<input class='btn btn-primary' type='submit' value='Eliminar Oficina'>");
		out.print("</div>");
		out.print("</div>");
		out.flush();
	    out.close();

	}
%>