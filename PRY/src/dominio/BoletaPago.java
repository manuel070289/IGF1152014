package dominio;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

import org.apache.tomcat.util.buf.StringCache;


public class BoletaPago implements Serializable {
	private static final long serialVersionUID = 1L;
	private Short id_boletapago;
	private String periodo_pago;
	private BigDdecimal sueldo_neto;
	private String id_empleado;

	private BoletaPago(){

	}

	public BoletaPago (String periodo_pago, BigDecimal sueldo_neto, String id_empleado ){
		this.periodo_pago = periodo_pago;
		this.sueldo_neto = sueldo_neto;
		this.id_empleado = id_empleado;
	}
///////////////////////////ID_BOLETAPAGO///////////////////////////
	@Id
	@GeneratedValues(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id_boletapago")
	public Short getId_boletapago() {
		return id_boletapago;
	}
	public void setId_boletapago(Short id_boletapago) {
		this.id_boletapago = id_boletapago;
	}
	
	
///////////////////////////PERIODO_PAGO///////////////////////////
	@Basic(optional = false)
	@Column(name = "periodo_pago")
	public String getPeriodo_pago() {
		return periodo_pago;
	}
	public void setPeriodo_pago(String periodo_pago) {
		this.periodo_pago = periodo_pago;
	}
	
	
///////////////////////////SUELDO_NETO///////////////////////////
@Basic(optional = false)
@Column(name = "sueldo_neto")
	public BigDdecimal getSueldo_neto() {
		return sueldo_neto;
	}
	public void setSueldo_neto(BigDdecimal sueldo_neto) {
		this.sueldo_neto = sueldo_neto;
	}
	
	
	
///////////////////////////ID_EMPLEADO///////////////////////////
@Basic(optional = false)
@Column(name = "id_empleado")
	public String getId_empleado() {
		return id_empleado;
	}
	public void setId_empleado(String id_empleado) {
		this.id_empleado = id_empleado;
	}

}
