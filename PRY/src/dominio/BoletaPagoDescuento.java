package dominio;


import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 *
 */
@Entity
@Table(name = "boletapagodescuento", catalog = "igf2014v2")
@NamedQueries({
	@NamedQuery(name = "daBoletaPagoDescuentoPorId", query = "from BoletaPagoDescuento as boletapagodescuento where boletapagodescuento.idBoletapagosdescuento=:id_BoletaPagosDescuento"),
	@NamedQuery(name = "buscarTodosBPD", query = "from BoletaPagoDescuento as boletapagodescuento"),
	
})
public class BoletaPagoDescuento implements java.io.Serializable {

	@Id
	@Column(name = "id_boletapagosdescuento", unique = true, nullable = false)
	private int idBoletapagosdescuento;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_tiposdescuentos", nullable = false)
	private TiposDescuentos tiposDescuentos;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_boletapago", nullable = false)
	private BoletaPago boletaPago;
	@Column(name = "monto_descuento", nullable = false, precision = 11)
	private BigDecimal montoDescuento;
	@Column(name = "usuario_creador")
	private Integer usuarioCreador;
	@Column(name = "usuario_modifica")
	private Integer usuarioModifica;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha_creacion", length = 19)
	private Date fechaCreacion;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha_modifica", length = 19)
	private Date fechaModifica;
	@Column(name = "activo", nullable = false)
	private int activo;

	public BoletaPagoDescuento() {
	}

	public BoletaPagoDescuento(int idBoletapagosdescuento,
			TiposDescuentos tiposDescuentos, BoletaPago boletaPago,
			BigDecimal montoDescuento, int activo) {
		this.idBoletapagosdescuento = idBoletapagosdescuento;
		this.tiposDescuentos = tiposDescuentos;
		this.boletaPago = boletaPago;
		this.montoDescuento = montoDescuento;
		this.activo = activo;
	}

	public BoletaPagoDescuento(int idBoletapagosdescuento,
			TiposDescuentos tiposDescuentos, BoletaPago boletaPago,
			BigDecimal montoDescuento, Integer usuarioCreador,
			Integer usuarioModifica, Date fechaCreacion, Date fechaModifica,
			int activo) {
		this.idBoletapagosdescuento = idBoletapagosdescuento;
		this.tiposDescuentos = tiposDescuentos;
		this.boletaPago = boletaPago;
		this.montoDescuento = montoDescuento;
		this.usuarioCreador = usuarioCreador;
		this.usuarioModifica = usuarioModifica;
		this.fechaCreacion = fechaCreacion;
		this.fechaModifica = fechaModifica;
		this.activo = activo;
	}

	
	public int getIdBoletapagosdescuento() {
		return this.idBoletapagosdescuento;
	}

	public void setIdBoletapagosdescuento(int idBoletapagosdescuento) {
		this.idBoletapagosdescuento = idBoletapagosdescuento;
	}

	
	public TiposDescuentos getTiposdescuentos() {
		return this.tiposDescuentos;
	}

	public void setTiposdescuentos(TiposDescuentos tiposDescuentos) {
		this.tiposDescuentos = tiposDescuentos;
	}

	
	public BoletaPago getBoletapago() {
		return this.boletaPago;
	}

	public void setBoletapago(BoletaPago boletaPago) {
		this.boletaPago = boletaPago;
	}

	
	public BigDecimal getMontoDescuento() {
		return this.montoDescuento;
	}

	public void setMontoDescuento(BigDecimal montoDescuento) {
		this.montoDescuento = montoDescuento;
	}

	
	public Integer getUsuarioCreador() {
		return this.usuarioCreador;
	}

	public void setUsuarioCreador(Integer usuarioCreador) {
		this.usuarioCreador = usuarioCreador;
	}

	
	public Integer getUsuarioModifica() {
		return this.usuarioModifica;
	}

	public void setUsuarioModifica(Integer usuarioModifica) {
		this.usuarioModifica = usuarioModifica;
	}

	
	public Date getFechaCreacion() {
		return this.fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	
	public Date getFechaModifica() {
		return this.fechaModifica;
	}

	public void setFechaModifica(Date fechaModifica) {
		this.fechaModifica = fechaModifica;
	}

	
	public int getActivo() {
		return this.activo;
	}

	public void setActivo(int activo) {
		this.activo = activo;
	}

}
