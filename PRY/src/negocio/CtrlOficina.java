package negocio;

import dominio.*;
import dao.*;
public class CtrlOficina {
	private OficinaDAO daoOficina=new OficinaDAO();
	
	public boolean crearOficina(String nombOficina, String domicilio,Municipio municipio,Departamento departamento){ 
		if(daoOficina.daNombreOficina(nombOficina) == null) { 
			if(departamento != null && municipio!=null) { 
				Oficina oficina = new Oficina(nombOficina, domicilio, municipio,departamento) ; 
				daoOficina.guardaActualiza(oficina) ; 
				return true;  
		  } 
		else
			return false; 
		 }
		else
			 return false;
	}
}
