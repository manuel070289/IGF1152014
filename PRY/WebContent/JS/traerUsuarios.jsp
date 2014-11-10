<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="dominio.*"%>
<%@page import="negocio.*" %>
<%
	CtrlUsuario ctrlUsuario= new CtrlUsuario();
	CtrlGenero ctrlGenero= new CtrlGenero();
	
	String id_usuario=request.getParameter("idUsu").trim();
	Integer accion=Integer.parseInt(request.getParameter("accion").trim());
	
	if(!id_usuario.equals(""))
	{
		Usuario usuario = ctrlUsuario.daoUsuarioById(Short.parseShort(id_usuario));
		
		if (usuario==null)
		{
			out.print("Descripción del Usuario");
		}
		else 
		{ 
			out.print("<div class='col-sm-7'>"
					+"<div class='form-group'>"
					+"<label for='nombre'>Nombre:</label>");
			if(accion==1)
				out.print("<input id='nombre' class='form-control' type='text' name='nombre' value='"+usuario.getNombre()+"' required>");
			if(accion==2)
				out.print("<input id='nombre' class='form-control' type='text' name='nombre' disabled value='"+usuario.getNombre()+"' required>");
			
			out.print("</div></div>");
			
			out.print("<div class='col-sm-7'>"
					+"<div class='form-group'>"
					+"<label for='apellido'>Apellido:</label>");
			if(accion==1)
				out.print("<input id='apellido' class='form-control' type='text' name='apellido' value='"+usuario.getApellido()+"' required>");
			if(accion==2)
				out.print("<input id='apellido' class='form-control' type='text' name='apellido' disabled value='"+usuario.getApellido()+"' required>");
			
			out.print("</div></div>");
		
			out.print("<div class='col-sm-7'>"
					+"<div class='form-group'>"
					+"<label for='genero'>Genero:</label>");
			if(accion==1)
			{
				List generos = ctrlGenero.dameTodosLosGeneros();
				int numeroGenero = generos.size();
				Genero genActual;
				out.print("<select required name='genero' id='genero'>");
				out.print("<option value=''>Seleccione</option>");
				for (int i=0; i < numeroGenero; i++) {
					genActual = (Genero) generos.get(i);
					if(genActual.getId_sexo().equals(usuario.getGenero().getId_sexo()))
						out.print("<option value='" + genActual.getId_sexo() + "' selected> " + genActual.getD_sexo()+"</option>");
					else
						out.print("<option value='" + genActual.getId_sexo() + "'> " + genActual.getD_sexo()+"</option>");
				}
				out.print("</select>");
			}
			if(accion==2)
				out.print("<input id='genero' class='form-control' type='text' name='genero' disabled value='"+usuario.getGenero().getD_sexo()+"' required>");
			
			out.print("</div></div>");
			
			out.print("<div class='col-sm-7'>"
					+"<div class='form-group'>"
					+"<label for='username'>Usuario:</label>");
			if(accion==1)
				out.print("<input id='username' class='form-control' type='text' name='username' value='"+usuario.getUsername()+"' required>");
			if(accion==2)
				out.print("<input id='username' class='form-control' type='text' name='username' disabled value='"+usuario.getUsername()+"' required>");
			out.print("</div></div>");
			
			if(accion==1)
			{
				out.print("<div class='col-sm-7'>"
						+"<div class='form-group'>"
						+"<label for='passwd'>Nueva Contraseña:</label>");
				out.print("<input id='passwd' class='form-control' type='password' name='passwd' required>");
				out.print("</div></div>");
			}
			
			String[] stArray={"Administrador","Usuario Comun","Usuario Planilla"};
			out.print("<div class='col-sm-7'>"
					+"<div class='form-group'>"
					+"<label for='rol'>Rol:</label>");
			if(accion==1)
			{
				out.print("<select required name='rol'>");
				out.print("<option value=''>Seleccione</option>");
				for(int i=0;i<stArray.length;i++)
				{
					if(usuario.getRol()==(i+1))
						out.print("<option value='"+(i+1)+"' selected>"+stArray[i]+"</option>");
					else
						out.print("<option value='"+(i+1)+"'>"+stArray[i]+"</option>");
				}
				out.print("</select>");
			}
			if(accion==2)
			{
				for(int i=0;i<stArray.length;i++)
				{
					if(usuario.getRol()==(i+1))
						out.print("<input id='rol' class='form-control' type='text' name='rol' disabled value='"+stArray[i]+"' required>");
				}
				
			}
				
			out.print("</div>");
			out.print("</div>");
			
		
		}		
		out.print("<div class='col-sm-7'>"
				+"<div class='form-group'>");
		if(accion==1)
			out.print("<input class='btn btn-primary' type='submit' value='Actualizar Usuario'>");
		if(accion==2)
			out.print("<input class='btn btn-primary' type='submit' value='Eliminar Usuario'>");
		out.print("</div>");
		out.print("</div>");
		out.flush();
	    out.close();
	}
%>