package negocio;

import java.util.Date;
import java.util.List;

import dominio.*;
import dao.*;
public class CtrlOficina {
	private OficinaDAO daoOficina=new OficinaDAO();
	
	public boolean crearOficina(String nombOficina, String domicilio,Municipio municipio,String id_usuario){ 
		if(daoOficina.daoNombreOficina(nombOficina) == null) { 
			if(municipio!=null) {
				String idOficina=daoOficina.daoLastId(); 
				Oficina oficina = new Oficina(idOficina,nombOficina, domicilio, municipio,id_usuario,new Date());
				daoOficina.guardaActualiza(oficina) ; 
				return true;  
		  } 
		else
			return false; 
		 }
		else
			 return false;
	}
	
	public boolean eliminarOficina(String nombOficina) {
		if (daoOficina.daoNombreOficina(nombOficina) != null) {
			Oficina oficina =	daoOficina.daoNombreOficina(nombOficina) ;
			daoOficina.eliminar(oficina) ;
			return true ;
		}
		else
			return false ;
	}
	
	public boolean modificarOficina(String nombOficina, Municipio municipio) {
		if(daoOficina.daoNombreOficina(nombOficina) != null) {
			Oficina oficina =	daoOficina.daoNombreOficina(nombOficina) ;
			oficina.setNomb_oficina(nombOficina);
			oficina.setMunicipio(municipio);
			daoOficina.guardaActualiza(oficina) ;
			return true ;
		}
		else
			return false ;
	}
	
	public List<Oficina> daoOficina(){
		return daoOficina.daoOficina() ;
	}
	public Oficina daoOficinaById(String idOficina) {
		return daoOficina.daoOficinaById(idOficina) ;
	}
	public Oficina daoOficinaByNombre(String nombOficina) {
		return daoOficina.daoOficinaByNombre(nombOficina) ;
	}
	
	public List<Oficina> daoOficinaByMun(String idMunicipio){
		return daoOficina.daoOficinaByMun(idMunicipio) ;
	}
}
