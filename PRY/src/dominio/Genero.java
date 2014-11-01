package dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="genero", catalog="igf2014",schema="")

public class Genero implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id_sexo;
	private String d_sexo;
	
	private Genero(){
		
	}
	
	public Genero (String id_sexo, String d_sexo){
		this.id_sexo = id_sexo;
		this.d_sexo = d_sexo;
		
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic (optional=false)
	@Column(name = "id_sexo")
	public String getId_sexo() {
		return id_sexo;
	}
	public void setId_sexo(String id_sexo) {
		this.id_sexo = id_sexo;
	}
	
	
	@Basic (optional=false)
	@Column(name = "d_sexo")
	public String getD_sexo() {
		return d_sexo;
	}
	public void setD_sexo(String d_sexo) {
		this.d_sexo = d_sexo;
	}
	
	
	
	

}
