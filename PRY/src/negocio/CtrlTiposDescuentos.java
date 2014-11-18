package negocio;

import java.math.BigDecimal;


import dominio.TiposDescuentos;
import dao.TiposDescuentosDAO;
import java.math.BigDecimal;
import java.util.List;


public class CtrlTiposDescuentos {
private TiposDescuentosDAO daoTD = new TiposDescuentosDAO();
	
	public boolean actualizarTipoDescuento(TiposDescuentos tipos) {
			if (tipos != null) {
		     daoTD.actualizar(tipos) ;
  		     return true ;
  		     }
		 else
			 return false ;
	}
	
	public boolean guardarTipoDescuento(TiposDescuentos TD){
		if (TD.getIdTiposdescuentos()!=null){
			daoTD.guarda(TD);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean eliminarTipoDescuento(String id){
		TiposDescuentos tipoDesc=daoTD.obtenerTipoDescuento(id);
		if (tipoDesc!=null){
			daoTD.eliminar(tipoDesc);
			return true;
		}else{
			return false;
		}
	}
	public TiposDescuentos get(String key){
		TiposDescuentos tipoDesc=daoTD.obtenerTipoDescuento(key);
		return tipoDesc;
	}
	public List<TiposDescuentos> buscarTodos(){
		List<TiposDescuentos> listaDescuentos=daoTD.findAll();
		return listaDescuentos;
	}
	public List<TiposDescuentos> buscarActivos(){
		List<TiposDescuentos> listaDescuentos=daoTD.findActivos();
		return listaDescuentos;
	}
	public List<TiposDescuentos> bucarPorEjemplo(TiposDescuentos TD){
		List<TiposDescuentos> listaDescuentos=daoTD.findByExample(TD);
		return listaDescuentos;
	}
	

}
