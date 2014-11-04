package dominio;

import java.io.Serializable;
import javax.persistence.*;

import java.math.BigDecimal;
import java.util.Date;
import org.apache.tomcat.util.buf.StringCache;


@Entity
@Table(name = "boletaPago", catalog = "igf2014", schema = "")
public class BoletaPago implements Serializable {
	private static final long serialVersionUID = 1L;
	private Short id_boletapago;
	private String periodo_pago;
	private BigDecimal sueldo_neto;
	private Empleado empleado;
	
	private BoletaPago(){

	}

	public BoletaPago (String periodo_pago, BigDecimal sueldo_neto, Empleado empleado ){
		this.periodo_pago = periodo_pago;
		this.sueldo_neto = sueldo_neto;
		this.empleado = empleado;
	}
	
	
	

	
///////////////////////////ID_BOLETAPAGO///////////////////////////
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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
	public BigDecimal getSueldo_neto() {
		return sueldo_neto;
	}
	public void setSueldo_neto(BigDecimal sueldo_neto) {
		this.sueldo_neto = sueldo_neto;
	}
	
	
	
///////////////////////////ID_EMPLEADO///////////////////////////
	
	@JoinColumn(name = "id_empleado", referencedColumnName = "id_empleado")
	
	//Multiplicidad N:1 Muchos boletapago pertenecen a un empleado
	@ManyToOne(optional = false)
//@Basic(optional = false)
//@Column(name = "id_empleado")
	public Empleado getEmpleado() {
		return empleado;
	}
	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}

}
