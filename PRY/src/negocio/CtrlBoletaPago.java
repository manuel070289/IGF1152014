package negocio;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import dao.BoletaPagoDAO;
import dao.EmpleadoDAO;
import dominio.BoletaPago;
import dominio.Empleado;


public class CtrlBoletaPago {
	private BoletaPagoDAO daoBp = new BoletaPagoDAO();
	private EmpleadoDAO emp = new EmpleadoDAO();
	public boolean crearBoletaPago(String periodo_pago, BigDecimal sueldo_neto, Empleado emp.daEMpleadobyId(id_empleado)) {
		if (daoBp.daBoletaPagoByPeriodoPagoyIdEMpleado(periodo_pago, empleado) == null ) {
			//if (empleado != null) {
				BoletaPago bP = new BoletaPago(periodo_pago, sueldo_neto, empleado) ;
				daoBp.guardaActualiza(bp) ;
				return true ;
		//	}
		//	else
			//	return false ;
		}
		else
			return false ;
	}
	public boolean borrarBoletaPago( Short id_boletapago) {
		if (daoBp.daBoletaPagoByPeriodoPagoyIdEMpleado(periodo_pago) != null  ) {
			BoletaPago bP= daoBp.daBoletaPagoByPeriodoPagoyIdEMpleado(periodo_pago) ;
			daoBp.eliminar(bP) ;
			return true ;
		}
		else
			return false ;
	}
	public List<BoletaPago> daBoletaPago(){
		return daoBp.BoletaPago() ;
	}
	public List daBoletaPagoByEmpleado(short id_empleado) {
		return daoBp.daEmpleadosByEmpleado(id_empleado) ;
	}
	
	public BoletaPago daBoletaPagoById(short id_boletapago){
		return daoBp.daBoletaPagoById(id_boletapago) ;
	}
	
	public List daBoletaPagoByPeriodo(String periodo_pago) {
		return daoBp.daBoletaPagoByPeriodo(periodo_pago) ;
	}
	

}
