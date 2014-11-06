package dominio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
	private List<Oficina> listOficina = new ArrayList<Oficina>();
	
	private Municipio(){
		
	}
	
	
	


	public  Municipio (String id_municipio, Departamento departamento, String nomb_municipio ) {
		this.id_municipio = id_municipio;
		this.departamento = departamento;
		this.nomb_municipio = nomb_municipio;
		
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
