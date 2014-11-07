package dominio;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import antlr.StringUtils;


@Entity
@Table(name="genero", catalog="igf2014",schema="")

public class Genero implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String id_sexo;
	private String d_sexo;
//	private List<Empleado> empleadoList;
	
	private Genero(){
		
	}
	
	public Genero (String id_sexo, String d_sexo){
		this.id_sexo = id_sexo.trim().toUpperCase();
		this.d_sexo = d_sexo.trim().substring(0,1).toUpperCase() + d_sexo.substring(1);	
	}
	
	
///////////////////////////id_sexo///////////////////////////
	@Id
	@Basic (optional=false)
	@Column(name = "id_sexo")
	public String getId_sexo() {
		return id_sexo;
	}
	
	public void setId_sexo(String id_sexo) {
		this.id_sexo = id_sexo.trim().toUpperCase();
	}
	
	
	
///////////////////////////d_sexo///////////////////////////
	@Basic (optional=false)
	@Column(name = "d_sexo")
	public String getD_sexo() {
		return d_sexo;
	}
	
	public void setD_sexo(String d_sexo) {
		this.d_sexo = d_sexo.trim().substring(0,1).toUpperCase() + d_sexo.substring(1);
	}
	
	// @OneToMany: (1:N) Asocia varios campos con uno
	// Multiplicidad 1:N Un genero tiene muchos empleados
//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "genero" )
//	public List<Empleado> getEmpleadoList() {
//		return empleadoList;
//	}
//	public void setEmpleadoList(List<Empleado> empleadoList) {
//		this.empleadoList = empleadoList;
//	}
	
	

}
