package dominio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
/*import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;*/
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

 
 	

@Entity
@Table(name = "departamento", catalog = "igf2014", schema = "")
public class Departamento implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id_depto;
	private String nombre_depto;
	private String zona_geografica;
	private List<Municipio> municipioList = new ArrayList<Municipio>();
	/*private List<Oficina> oficinaList = new ArrayList<Oficina>();*/
	

	private Departamento (){
		
	}
	
	
	public Departamento (String id_depto, String nombre_depto, String zona_geografica){
		this.id_depto = id_depto;
		this.nombre_depto = nombre_depto;
		this.zona_geografica = zona_geografica;
		
	}
	
	
///////////////////////////id_depto///////////////////////////
	@Id
/*	@GeneratedValue(strategy = GenerationType.IDENTITY)*/
	@Basic(optional = false)
	@Column(name = "id_depto")
	public String getId_depto() {
		return id_depto;
	}
	public void setId_depto(String id_depto) {
		this.id_depto = id_depto;
	}
	
	
///////////////////////////nombre_depto///////////////////////////
	@Basic(optional = false)
	@Column(name = "nombre_depto")
	public String getNombre_depto() {
		return nombre_depto;
	}
	public void setNombre_depto(String nombre_depto) {
		this.nombre_depto = nombre_depto;
	}
	
	
///////////////////////////zona_geografica///////////////////////////
	@Basic(optional = false)
	@Column(name = "zona_geografica")
	public String getZona_geografica() {
		return zona_geografica;
	}
	public void setZona_geografica(String zona_geografica) {
		this.zona_geografica = zona_geografica;
	}


		
	/////////////////////////////////////////////////////////////////////
	// @OneToMany: (1:N) Asocia varios campos con uno
	// Multiplicidad 1:N Un departamento tiene muchos municipios
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "departamento")
	
	public List<Municipio> getMunicipioList() {
		return municipioList;
	}


	public void setMunicipioList(List<Municipio> municipioList) {
		this.municipioList = municipioList;
	}
	
	
	/////////////////////////////////////////////////////////////////////////
	//un departamento muchas oficinas
	/*@OneToMany(cascade = CascadeType.ALL, mappedBy = "depto")
	public List<Oficina> getOficinaList() {
		return oficinaList;
	}


	public void setOficinaList(List<Oficina> oficinaList) {
		this.oficinaList = oficinaList;
	}*/

	
	

}
