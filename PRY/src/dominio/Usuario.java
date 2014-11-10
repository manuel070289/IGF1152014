package dominio;

import java.io.Serializable;

import javax.persistence.*;


@Entity
@Table(name="Usuario",catalog="igf2014",schema="")
@NamedQueries({})
public class Usuario implements Serializable{
	private static final long serialVersionUID=1L;
	private Short id_usuario;
	private String nombre;
	private String apellido;
	private Genero id_sexo;
	private String username;
	private String passwd;
	private Short rol;
	private Short activo;
	
	private Usuario(){}
	
	public Usuario(String nombre,String apellido,Genero id_sexo,String username,String passwd,Short rol){
		this.nombre=nombre;
		this.apellido=apellido;
		this.id_sexo=id_sexo;
		this.username=username;
		this.passwd=passwd;
		this.rol=rol;
		this.activo=Short.parseShort("1");
	}

	@Id
	@Basic(optional = false)
	@Column(name="id_usuario")
	public Short getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Short id_usuario) {
		this.id_usuario = id_usuario;
	}

	@Basic(optional = false)
	@Column(name="nombre")
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Basic(optional = false)
	@Column(name="apellido")
	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	@Id
	@JoinColumn(name="id_sexo", referencedColumnName="id_sexo")
	@ManyToOne(optional = false)
	public Genero getGenero() {
		return id_sexo;
	}

	public void setGenero(Genero id_sexo) {
		this.id_sexo = id_sexo;
	}

	@Basic(optional = false)
	@Column(name="username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Basic(optional = false)
	@Column(name="passwd")
	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Basic(optional = false)
	@Column(name="rol")
	public Short getRol() {
		return rol;
	}

	public void setRol(Short rol) {
		this.rol = rol;
	}

	@Basic(optional = false)
	@Column(name="activo")
	public Short getActivo() {
		return activo;
	}

	public void setActivo(Short activo) {
		this.activo = activo;
	}
	
	
	
}
