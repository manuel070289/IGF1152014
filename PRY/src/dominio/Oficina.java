package dominio;

import java.io.Serializable;
import java.util.Date;

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
	@Column(name="nom_oficina")
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

	@Id
	@Column
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
}
