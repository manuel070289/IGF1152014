package dominio;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="Oficina",catalog="igf2014",schema="")
@NamedQueries({})
public class Oficina implements Serializable{
	private static final long serialVersionUID=1L;
	private String idOficina;
	private String nombOficina;
	private String domicilio;
	private Municipio municipio;
	
	private Short usuario_creador;
	private Short usuario_modifica;
	private Date fecha_creacion;
	private Date fecha_modifica;
	private Short activo;
	
	private List<Empleado> listEmpleado ;
	
	private Oficina(){}
	
	public Oficina(String nombOficina,String domicilio,Municipio municipio,Departamento idDepto){
		this.nombOficina=nombOficina;
		this.domicilio=domicilio;
		this.municipio=municipio;
	}
	@Id
	@Basic(optional = false)
	@Column(name="id_oficina")
	public String getIdOficina(){
		return this.idOficina;
	}
	public void setIdOficina(String idOficina){
		this.idOficina=idOficina;
	}
	
	@Basic(optional = false)
	@Column(name="nomb_oficina")
	public String getNombOficina() {
		return nombOficina;
	}

	public void setNombOficina(String nombOficina) {
		this.nombOficina = nombOficina;
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
	@Column(name="usuario_creador")
	public Short getUsuario_creador() {
		return usuario_creador;
	}

	public void setUsuario_creador(Short usuario_creador) {
		this.usuario_creador = usuario_creador;
	}

	@Basic(optional = false)
	@Column(name="usuario_modifica")
	public Short getUsuario_modifica() {
		return usuario_modifica;
	}

	public void setUsuario_modifica(Short usuario_modifica) {
		this.usuario_modifica = usuario_modifica;
	}

	@Basic(optional = false)
	@Column(name="fecha_crecion")
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
	//un municipio tiene muchas oficinas
	public List<Empleado> getListEmpleado() {
		return listEmpleado;
	}
	
	
	public void setListEmpleado(List<Empleado> listEmpleado) {
		this.listEmpleado = listEmpleado;
	}
	
}
