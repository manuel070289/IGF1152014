package negocio;

import java.util.Date;

import dao.GeneroDAO;
import dominio.Genero;

public class CtrlGenero {
	GeneroDAO daoGenero = new GeneroDAO();
	
	public boolean crearGenero(String dSexo, short id_usuario) {
		if(daoGenero.daGeneroByDefinicion(dSexo) == null) {
			String idSexo = dSexo.substring(0, 1);
			Genero genero = new Genero(idSexo, dSexo);
			
			genero.setUsuario_creador(id_usuario);
			genero.setUsuario_modifica(id_usuario);
			genero.setFecha_creacion(new Date());
			genero.setFecha_modifica(new Date());
			
			daoGenero.guardaActualiza(genero);
			return true;
		}
		return false;
	}
	
	public boolean modificarGenero(String idSexo, String nvo_genero, short id_usuario) {
		if(daoGenero.daGeneroById(idSexo) != null) {
			Genero genero = daoGenero.daGeneroById(idSexo);
			
			genero.setD_sexo(nvo_genero);
			genero.setUsuario_modifica(id_usuario);
			genero.setFecha_modifica(new Date());
			
			daoGenero.guardaActualiza(genero);
			return true;
		}
		return false;
	}
	
	
}
