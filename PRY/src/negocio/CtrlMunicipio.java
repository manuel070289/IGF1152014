package negocio;

import java.util.ArrayList;
import java.util.List;

import dao.DepartamentoDAO;
import dao.MunicipioDAO;
import dominio.Departamento;
import dominio.Municipio;



public class CtrlMunicipio {


	private MunicipioDAO daoMun = new MunicipioDAO() ;
	private DepartamentoDAO daoDepto = new DepartamentoDAO();
	public boolean crearMunicipio(String id_municipio, String nombre_depto, String nomb_municipio ) {
		if (daoMun.daMunicipioByNombre(nomb_municipio) == null) {
			if(daoDepto.daDepartamentoByNombre(nombre_depto)!=null){
				Departamento departamento;
				departamento = daoDepto.daDepartamentoByNombre(nombre_depto);
				
				Municipio municipio = new Municipio(id_municipio, departamento, nomb_municipio);
				daoMun.guardaActualiza(municipio) ;
				
				/*AGREGANDO LA PERSISTENCIA DEL MUNICIPIO EN DEPARTAMENTO*/
				List<Municipio> municipioList = new ArrayList<Municipio>();
				municipioList.add(municipio);
				departamento.setMunicipioList(municipioList);
				daoDepto.guardaActualiza(departamento);
				/*-------------------------------------------------------*/
				
				return true ;
			}
			return false;
		}
		else
			return false ;
	}
	public boolean eliminarMunicipio(String nomb_municipio) {
		if (daoMun.daMunicipioByNombre(nomb_municipio) != null) {

			Municipio municipio =	daoMun.daMunicipioByNombre(nomb_municipio) ;
			daoMun.eliminar(municipio) ;
			return true ;
		}
		else
			return false ;
	}
	public boolean modificarMunicipio(String nomb_municipio, String nuevo_nombre) {
		if(daoMun.daMunicipioByNombre(nomb_municipio) != null) {
			Municipio municipio =	daoMun.daMunicipioByNombre(nomb_municipio) ;
			municipio.setNomb_municipio(nuevo_nombre);
			daoMun.guardaActualiza(municipio) ;
			return true ;
		}
		else
			return false ;
	}
	public List<Municipio> daMinicipios(){
		return daoMun.daMunicipios() ;
	}
	public Municipio daMunicipioById(String id_municipio) {
		return daoMun.daMunicipioDepartamentoById(id_municipio) ;
	}
	public Municipio daMunicipioByNombre(String nomb_municipio) {
		return daoMun.daMunicipioByNombre(nomb_municipio) ;
	}
	





}
