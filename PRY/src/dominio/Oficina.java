package dominio;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="Oficina",catalog="igf2014",schema="")
@NamedQueries({})
public class Oficina implements Serializable{
	private static final long serialVersionUID=1L;
	private String id_oficina;
	private String nomb_oficina;
	private String domicilio;
	private Municipio municipio;
	
	private Short id_usuario_creador;
	private Short id_usuario_modifica;
	private Date fecha_creacion;
	private Date fecha_modifica;
	private Short activo; 
	
	private List<Empleado> listEmpleado ;
	
	private Oficina(){}
	
	public Oficina(String idOficina,String nombOficina,String domicilio,Municipio municipio,String id_usuario,Date fecha){
		this.id_oficina=idOficina;
		this.nomb_oficina=nombOficina;
		this.domicilio=domicilio;
		this.municipio=municipio;
		this.id_usuario_creador=Short.parseShort(id_usuario);
		this.id_usuario_modifica=Short.parseShort(id_usuario);
		this.fecha_creacion = fecha;
		this.fecha_modifica = fecha;
		this.activo=1;
	}
	@Id
	@Basic(optional = false)
	@Column(name="id_oficina")
	public String getId_oficina(){
		return this.id_oficina;
	}
	public void setId_oficina(String idOficina){
		this.id_oficina=idOficina;
	}
	
	@Basic(optional = false)
	@Column(name="nomb_oficina")
	public String getNomb_oficina() {
		return nomb_oficina;
	}

	public void setNomb_oficina(String nombOficina) {
		this.nomb_oficina = nombOficina;
	}

	@Basic(optional = false)
	@Column(name="domicilio")
	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	@ManyToOne
	@JoinColumns({
		@JoinColumn(name="id_municipio", referencedColumnName="id_municipio"),
		@JoinColumn(name="id_depto", referencedColumnName="id_depto")
	})
	public Municipio getMunicipio(){
		 return this.municipio;
	}
	public void setMunicipio(Municipio municipio){
		 this.municipio=municipio;
	}

	@Basic(optional = false)
	@Column(name="id_usuario_creador")
	public Short getUsuario_creador() {
		return id_usuario_creador;
	}

	public void setUsuario_creador(Short usuario_creador) {
		this.id_usuario_creador = usuario_creador;
	}

	@Basic(optional = false)
	@Column(name="id_usuario_modifica")
	public Short getUsuario_modifica() {
		return id_usuario_modifica;
	}

	public void setUsuario_modifica(Short usuario_modifica) {
		this.id_usuario_modifica = usuario_modifica;
	}

	@Basic(optional = false)
	@Column(name="fecha_creacion")
	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	@Basic(optional = false)
	@Column(name="fecha_modifica")
	public Date getFecha_modifica() {
		return fecha_modifica;
	}

	public void setFecha_modifica(Date fecha_modifica) {
		this.fecha_modifica = fecha_modifica;
	}

	@Basic(optional = false)
	@Column(name="activo")
	public Short getActivo() {
		return activo;
	}

	public void setActivo(Short activo) {
		this.activo = activo;
	} 
	
	/////////////////////////////////////////////////////////////
	@OneToMany(cascade=CascadeType.ALL, mappedBy="oficina")
	//una oficina tiene muchos empleados
	public List<Empleado> getListEmpleado() {
		return listEmpleado;
	}
	
	
	public void setListEmpleado(List<Empleado> listEmpleado) {
		this.listEmpleado = listEmpleado;
	}
	
}
