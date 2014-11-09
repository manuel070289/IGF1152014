package negocio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.DepartamentoDAO;
import dao.MunicipioDAO;
import dao.OficinaDAO;
import dominio.Departamento;
import dominio.Municipio;



public class CtrlMunicipio {


	private MunicipioDAO daoMun = new MunicipioDAO() ;
	private DepartamentoDAO daoDepto = new DepartamentoDAO();
	private OficinaDAO daoOfi = new OficinaDAO();
	/*SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");*/
	Date fecha_creacion = new Date();
	Date fecha_modifica = new Date();
	
	public boolean crearMunicipio(String id_municipio, String id_depto, String nomb_municipio, Short usuario_creador, Short usuario_modifica) {
		if (daoMun.daMunicipioByNombre(nomb_municipio) == null) {
			if(daoDepto.daDepartamentoById(id_depto)!=null){
				Departamento departamento;
				departamento = daoDepto.daDepartamentoById(id_depto);
				Short activo = 1;
				
				Municipio municipio = new Municipio(id_municipio, departamento, nomb_municipio, usuario_creador,  usuario_modifica,  fecha_creacion, fecha_modifica, activo);
				daoMun.guardaActualiza(municipio) ;
				
				/*AGREGANDO LA PERSISTENCIA DEL MUNICIPIO EN DEPARTAMENTO*/
				/*SIRVE PARA CREAR TANTO DEPARTAMENTO COMO MUNICIPIO A LA MISMA VES
				ESTE CODIGO DEBERIA IR EN DEPARTAMENTO*/
				/*List<Municipio> municipioList = new ArrayList<Municipio>();
				municipioList.add(municipio);
				departamento.setMunicipioList(municipioList);*/
				/*daoDepto.guardaActualiza(departamento);*/
				/*-------------------------------------------------------*/
				
				return true ;
			}
			return false;
		}
		else
			return false ;
	}
	public boolean eliminarMunicipio(String id_municipio) {
		if (daoOfi.daoOficinaByMun(id_municipio).isEmpty()) {
			Municipio municipio = daoMun.daMunicipioById(id_municipio) ;
			daoMun.eliminar(municipio) ;
			return true ;
		}
		else
			return false ;
	}
	public boolean modificarMunicipio(String nomb_municipio, String nuevo_nombre, Short usuario_modifica) {
		if(daoMun.daMunicipioByNombre(nomb_municipio) != null) {
			Municipio municipio =	daoMun.daMunicipioByNombre(nomb_municipio) ;
			municipio.setNomb_municipio(nuevo_nombre);
			municipio.setId_usuario_modifica(usuario_modifica);
			municipio.setFecha_modifica(fecha_modifica);
			
			daoMun.guardaActualiza(municipio) ;
			return true ;
		}
		else
			return false ;
	}
	public List<Municipio> daMunicipios(){
		return daoMun.daMunicipios() ;
	}
	public Municipio daMunicipioById(String id_municipio) {
		return daoMun.daMunicipioById(id_municipio) ;
	}
	public Municipio daMunicipioByNombre(String nomb_municipio) {
		return daoMun.daMunicipioByNombre(nomb_municipio) ;
	}
	
	
	public List<Municipio> daMunicipiobyDepto(String id_depto){
		return daoMun.daMunicipioByDepto(id_depto) ;
	}





}
