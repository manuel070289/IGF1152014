package negocio;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import dao.PuestoDAO;
import dominio.Puesto;

public class CtrlPuesto {
	
	private PuestoDAO daopuesto = new PuestoDAO();
	
	public Puesto daPuestoById(Short id_puesto){		
		return daopuesto.daPuestoById(id_puesto);
	}
	
	public Puesto daPuestoByNombre(String nomb_puesto){		
		return daopuesto.daPuestoByNombre(nomb_puesto);
	}
	
	public List<Puesto> daPuestoTodos(){
		return daopuesto.daPuesto();
	}
	
	public boolean consultarPuesto(String nomb_puesto){
		
		if(daopuesto.daPuestoByNombre(nomb_puesto)!=null){		
			return true;	
		}
		else{			
			return false;
		}		
	}//fin del metodo boolean consultarPuesto
	
	public boolean guardarPuesto(String nomb_puesto, String perfil_puesto, Date fecha_ing,
			BigDecimal sueldo_min, BigDecimal sueldo_max,
			String id_usuario_creador, String id_usuario_modifica,
			Date fecha_creacion, Date fecha_modifica, Integer activo){
		
		if(daopuesto.daPuestoByNombre(nomb_puesto)==null){
			Puesto ps = new Puesto(nomb_puesto, perfil_puesto, fecha_ing, sueldo_min, sueldo_max,
					id_usuario_creador, id_usuario_modifica, fecha_creacion, fecha_modifica, activo);
			daopuesto.guardaActualiza(ps);
			return true;	
		}
		else{			
			return false;
		}		
	}
	
	public boolean eliminarPuesto(String nomb_puesto){
		if(daopuesto.daPuestoByNombre(nomb_puesto)!=null){ //buscamos pais por su nombre
			Puesto ps = daopuesto.daPuestoByNombre(nomb_puesto); 
			daopuesto.eliminar(ps);
			return true;	//si existe y se elimino
		}else{
			return false; //el pais no existe en la BD
		}		
	}
	
	
	public boolean modificarPuesto(String nomb_puesto, String perfil_puesto, BigDecimal sueldo_min,
			BigDecimal sueldo_max, Date fecha_modifica, Integer activo){
		if(daopuesto.daPuestoByNombre(nomb_puesto)!=null){ //buscamos pais por su nombre
			Puesto ps = daopuesto.daPuestoByNombre(nomb_puesto);
			ps.setNomb_puesto(nomb_puesto);
			ps.setPerfil_puesto(perfil_puesto);
			ps.setSueldo_min(sueldo_min);
			ps.setSueldo_max(sueldo_max);
			ps.setFecha_modifica(fecha_modifica);
			ps.setActivo(activo);
			daopuesto.guardaActualiza(ps);
			return true;	//si existe y se elimino
		}else{
			return false; //el pais no existe en la BD
		}		
	}

}
