package negocio;

import java.util.List;

import dao.BoletaPagoDAO;
import dominio.BoletaPago;
import dominio.TiposDescuentos;

public class CtrlBoletaPago {
private BoletaPagoDAO daoBP = new BoletaPagoDAO();
	
	public boolean actualizarlBoletaPago(BoletaPago tipos) {
			if (tipos != null) {
		     daoBP.actualizar(tipos) ;
  		     return true ;
  		     }
		 else
			 return false ;
	}
	
	public boolean guardarBoletaPago(BoletaPago BP){
		if (BP.getIdBoletapago()!=0){
			daoBP.guardar(BP);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean eliminarBoletaPago(short id){
		BoletaPago BP=daoBP.obtenerBoletaPago(id);
		if (BP!=null){
			daoBP.eliminar(BP);
			return true;
		}else{
			return false;
		}
	}
	public BoletaPago get(short key){
		BoletaPago BP=daoBP.obtenerBoletaPago(key);
		return BP;
	}
	public List<BoletaPago> buscarTodos(){
		List<BoletaPago> listaDescuentos=daoBP.findAll();
		return listaDescuentos;
	}
	public List<BoletaPago> bucarPorEjemplo(BoletaPago BP){
		List<BoletaPago> listaBP=daoBP.findByExample(BP);
		return listaBP;
	}
}
