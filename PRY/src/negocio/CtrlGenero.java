package negocio;

import dao.GeneroDAO;
import dominio.Genero;

public class CtrlGenero {
	GeneroDAO daoGenero = new GeneroDAO();
	
	public boolean crearGenero(String dSexo) {
		if(daoGenero.daGeneroByDefinicion(dSexo) == null) {
			String idSexo = dSexo.substring(0, 1);
			Genero genero = new Genero(idSexo, dSexo);
			daoGenero.guardaActualiza(genero);
			return true;
		}
		return false;
	}
}
