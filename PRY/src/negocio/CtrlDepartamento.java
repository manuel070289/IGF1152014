package negocio;

import java.util.ArrayList;
import java.util.List;

import dao.DepartamentoDAO;
import dao.MunicipioDAO;
import dominio.Departamento;
import dominio.Municipio;

public class CtrlDepartamento {

	private DepartamentoDAO daoDepto = new DepartamentoDAO() ;
	private MunicipioDAO muni = new MunicipioDAO() ;
	public boolean crearDepartamento(String id_depto, String nombre_depto, String zona_geografica ) {
		if (daoDepto.daDepartamentoByNombre(nombre_depto) == null) {
			Departamento departamento = new Departamento(id_depto, nombre_depto, zona_geografica);
			daoDepto.guardaActualiza(departamento) ;
			return true ;
		}
		else
			return false ;
	}
	public boolean eliminarDepartamento(String id_depto) {
		if (muni.daMunicipioByDepto(id_depto).isEmpty()) {
			Departamento departamento =	daoDepto.daDepartamentoById(id_depto) ;
			daoDepto.eliminar(departamento) ;
			return true ;
		}
		else
			return false ;
	}
	public boolean modificarDepartamento(String id_depto,String nombre_depto, String zona_geografica) {
		if(daoDepto.daDepartamentoById(id_depto) != null) {
			Departamento departamento =	daoDepto.daDepartamentoById(id_depto);
			departamento.setZona_geografica(zona_geografica);
			departamento.setNombre_depto(nombre_depto);
			daoDepto.Actualiza(departamento);
			return true ;
		}
		else
			return false ;
	}
	public List<Departamento> daDepartamentos(){
		return daoDepto.daDepartamentos() ;
	}
	public Departamento daDepartamentoById(String id_depto) {
		return daoDepto.daDepartamentoById(id_depto) ;
	}
	public Departamento daDepartamentoByNombre(String nombre_depto) {
		return daoDepto.daDepartamentoByNombre(nombre_depto) ;
	}
	public List<Departamento> daDepartamentoByZona(String zona_geografica) {
		return daoDepto.daDepartamentoByZona(zona_geografica) ;
	}
	
	
	


}
