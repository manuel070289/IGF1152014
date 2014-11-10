package dominio;

import java.io.Serializable;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.GregorianCalendar;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;




@Entity 
@Table(name = "municipio", catalog = "igf2014", schema = "")
public class Municipio implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id_municipio;
	private Departamento departamento;
	private String nomb_municipio;
	private List<Oficina> listOficina ;
	
	private Short id_usuario_creador;
	private Short id_usuario_modifica;
	private Date fecha_creacion;
	private Date fecha_modifica;
	private Short activo; 
	/*SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");*/
	
	
	private Municipio(){
		
	}

	public  Municipio (String id_municipio, Departamento departamento, String nomb_municipio,Short usuario_creador, Short usuario_modifica, Date fecha_creacion, Date fecha_modifica, Short activo ) {
		this.id_municipio = id_municipio;
		this.departamento = departamento;
		this.nomb_municipio = nomb_municipio;
		this.fecha_creacion = fecha_creacion;
		this.fecha_modifica =  fecha_modifica;
		this.id_usuario_creador = usuario_creador;
		this.id_usuario_modifica = usuario_modifica;
		this.activo = activo;
		
	}
	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
public Short getId_usuario_creador() {
		return id_usuario_creador;
	}

	public void setId_usuario_creador(Short id_usuario_creador) {
		this.id_usuario_creador = id_usuario_creador;
	}

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Short getId_usuario_modifica() {
		return id_usuario_modifica;
	}

	public void setId_usuario_modifica(Short id_usuario_modifica) {
		this.id_usuario_modifica = id_usuario_modifica;
	}

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Date getFecha_modifica() {
		return fecha_modifica;
	}

	public void setFecha_modifica(Date fecha_modifica) {
		this.fecha_modifica = fecha_modifica;
	}

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Short getActivo() {
		return activo;
	}

	public void setActivo(Short activo) {
		this.activo = activo;
	}

	///////////////////////////id_municipio///////////////////////////
	@Id
	/*@GeneratedValue(strategy = GenerationType.IDENTITY)*/
	@Basic(optional = false)
	@Column(name = "id_municipio")
	public String getId_municipio() {
		return id_municipio;
	}
	public void setId_municipio(String id_municipio) {
		this.id_municipio = id_municipio;
	}
	
	
	
///////////////////////////id_depto///////////////////////////
	@Id
	@JoinColumn(name = "id_depto", referencedColumnName = "id_depto")
	//Multiplicidad N:1 Muchos empleados pertenecen a un departamento
	@ManyToOne(optional = false)
	public Departamento getDepartamento() {
		return departamento;
	}
	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}
	
	
///////////////////////////nomb_municipio///////////////////////////
	@Basic(optional = false)
	@Column(name = "nomb_municipio")
	public String getNomb_municipio() {
		return nomb_municipio;
	}
	public void setNomb_municipio(String nomb_municipio) {
		this.nomb_municipio = nomb_municipio;
	}
	
	
	
	
	/////////////////////////////////////////////////////////////
	@OneToMany(cascade=CascadeType.ALL, mappedBy="municipio")
	//un municipio tiene muchas oficinas
	public List<Oficina> getListOficina() {
		return listOficina;
	}


	public void setListOficina(List<Oficina> listOficina) {
		this.listOficina = listOficina;
	}	

}
