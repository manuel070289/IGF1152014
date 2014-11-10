package negocio;

import java.util.List;

import dao.BoletaPagoDescuentoDAO;
import dao.TiposDescuentosDAO;
import dominio.BoletaPago;
import dominio.BoletaPagoDescuento;
import dominio.TiposDescuentos;

public class CtrlBoletaPagoDescuento {
private BoletaPagoDescuentoDAO daoTD = new BoletaPagoDescuentoDAO();
	
	public boolean actualizarBoletaPagoDescuento(BoletaPagoDescuento tipos) {
			if (tipos != null) {
		     daoTD.actualizar(tipos) ;
  		     return true ;
  		     }
		 else
			 return false ;
	}
	
	public boolean guardarBoletaPagoDescuento(BoletaPagoDescuento BPD){
		if (BPD.getIdBoletapagosdescuento()!=0){
			daoTD.guarda(BPD);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean eliminarBoletaPagoDescuento(int id){
		BoletaPagoDescuento BoletaPD=daoTD.obtenerBoletaPagoDescuento(id);
		if (BoletaPD!=null){
			daoTD.eliminar(BoletaPD);
			return true;
		}else{
			return false;
		}
	}
	public BoletaPagoDescuento get(int key){
		BoletaPagoDescuento BP=daoTD.obtenerBoletaPagoDescuento(key);
		return BP;
	}
	public List<BoletaPagoDescuento> buscarTodos(){
		List<BoletaPagoDescuento> listaBPD=daoTD.findAll();
		return listaBPD;
	}
	public List<BoletaPagoDescuento> bucarPorEjemplo(BoletaPagoDescuento BPD){
		List<BoletaPagoDescuento> listaBPD=daoTD.findByExample(BPD);
		return listaBPD;
	}
	



}
