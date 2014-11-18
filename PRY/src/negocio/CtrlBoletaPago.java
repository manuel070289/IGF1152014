package negocio;

import java.util.List;

import dao.BoletaPagoDAO;
import dominio.BoletaPago;
import dominio.Puesto;
import dominio.TiposDescuentos;

public class CtrlBoletaPago {
	
	private BoletaPagoDAO daobp = new BoletaPagoDAO();

	public BoletaPago daBoletaPagoById(Short id_boletapago){		
		return daobp.daBoletaPagoById(id_boletapago);
	}
	
	public BoletaPago daBoletaPagoByNombre(String periodo_pago){		
		return daobp.daBoletaPagoByNombre(periodo_pago);
	}
	
	public List<BoletaPago> daBoletaPagoTodos(){
		return daobp.daBoletaPago();
	}
	
	public boolean consultarBoletaPago(String periodo_pago){
		
		if(daobp.daBoletaPagoByNombre(periodo_pago)!=null){		
			return true;	
		}
		else{			
			return false;
		}		
	}//fin del metodo boolean consultarPuesto
	
	public boolean actualizarlBoletaPago(BoletaPago tipos) {
			if (tipos != null) {
		     daobp.guardaActualiza(tipos) ;
  		     return true ;
  		     }
		 else
			 return false ;
	}
	
	public boolean guardarBoletaPago(BoletaPago bp){
		if (bp.getIdBoletapago()!=0){
			daobp.guardaActualiza(bp);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean eliminarBoletaPago(short id_boletapago){
		BoletaPago bp=daobp.daBoletaPagoById(id_boletapago);
		if (bp!=null){
			daobp.guardaActualiza(bp);
			return true;
		}else{
			return false;
		}
	}

}
