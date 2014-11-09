package dominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="puesto",catalog = "igf2014", schema = "")
public class Puesto implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name="id_puesto")
	private Short id_puesto;
	
	@Basic(optional = false)
	@Column(name="nomb_puesto")
	private String nomb_puesto;
	
	@Basic(optional = false)
	@Column(name="perfil_puesto")
	private String perfil_puesto;
	
	@Basic(optional = false)
	@Column(name="fecha_ing")
	private Date fecha_ing;
	
	@Basic(optional = false)
	@Column(name="sueldo_min")
	private BigDecimal sueldo_min;
	
	@Basic(optional = false)
	@Column(name="sueldo_max")
	private BigDecimal sueldo_max;
	
	@Basic(optional = false)
	@Column(name="id_usuario_creador")
	private String id_usuario_creador;
	
	@Basic(optional = false)
	@Column(name="id_usuario_modifica")
	private String id_usuario_modifica;
	
	@Basic(optional = false)
	@Column(name="fecha_creacion")
	private Date fecha_creacion;
	
	@Basic(optional = false)
	@Column(name="fecha_modifica")
	private Date fecha_modifica;
	
	@Basic(optional = false)
	@Column(name="activo")
	private Integer activo;
	
	
	
	public Puesto() {
			// TODO Auto-generated constructor stub
	}

	public Puesto(String nomb_puesto, String perfil_puesto, Date fecha_ing,
			BigDecimal sueldo_min, BigDecimal sueldo_max,
			String id_usuario_creador, String id_usuario_modifica,
			Date fecha_creacion, Date fecha_modifica, Integer activo) {
		this.nomb_puesto = nomb_puesto;
		this.perfil_puesto = perfil_puesto;
		this.fecha_ing = fecha_ing;
		this.sueldo_min = sueldo_min;
		this.sueldo_max = sueldo_max;
		this.id_usuario_creador = id_usuario_creador;
		this.id_usuario_modifica = id_usuario_modifica;
		this.fecha_creacion = fecha_creacion;
		this.fecha_modifica = fecha_modifica;
		this.activo = activo;
	}


	public Short getId_puesto() {
		return id_puesto;
	}
	public void setId_puesto(Short id_puesto) {
		this.id_puesto = id_puesto;
	}
	public String getNomb_puesto() {
		return nomb_puesto;
	}
	public void setNomb_puesto(String nomb_puesto) {
		this.nomb_puesto = nomb_puesto;
	}
	public String getPerfil_puesto() {
		return perfil_puesto;
	}
	public void setPerfil_puesto(String perfil_puesto) {
		this.perfil_puesto = perfil_puesto;
	}
	public Date getFecha_ing() {
		return fecha_ing;
	}
	public void setFecha_ing(Date fecha_ing) {
		this.fecha_ing = fecha_ing;
	}
	public BigDecimal getSueldo_min() {
		return sueldo_min;
	}
	public void setSueldo_min(BigDecimal sueldo_min) {
		this.sueldo_min = sueldo_min;
	}
	public BigDecimal getSueldo_max() {
		return sueldo_max;
	}
	public void setSueldo_max(BigDecimal sueldo_max) {
		this.sueldo_max = sueldo_max;
	}
	public String getId_usuario_creador() {
		return id_usuario_creador;
	}
	public void setId_usuario_creador(String id_usuario_creador) {
		this.id_usuario_creador = id_usuario_creador;
	}
	public String getId_usuario_modifica() {
		return id_usuario_modifica;
	}
	public void setId_usuario_modifica(String id_usuario_modifica) {
		this.id_usuario_modifica = id_usuario_modifica;
	}
	public Date getFecha_creacion() {
		return fecha_creacion;
	}
	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}
	public Date getFecha_modifica() {
		return fecha_modifica;
	}
	public void setFecha_modifica(Date fecha_modifica) {
		this.fecha_modifica = fecha_modifica;
	}
	public Integer getActivo() {
		return activo;
	}
	public void setActivo(Integer activo) {
		this.activo = activo;
	}
	
	

}
