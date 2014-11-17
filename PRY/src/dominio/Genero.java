package dominio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "genero", catalog = "igf2014", schema = "")
public class Genero implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id_sexo;
	private String d_sexo;
	private List<Usuario> usuarioList = new ArrayList<Usuario>();

	// CAMPOS PARA AUDITORIA
	private Short id_usuario_creador;
	private Short id_usuario_modifica;
	private Date fecha_creacion;
	private Date fecha_modifica;
	private Short activo;

	private Genero() {

	}

	public Genero(String id_sexo, String d_sexo) {
		this.id_sexo = id_sexo;
		this.d_sexo = d_sexo.trim().substring(0, 1).toUpperCase()
				+ d_sexo.substring(1);
		
		this.activo = 1;
	}

	// /////////////////////////id_sexo///////////////////////////
	@Id
	@Basic(optional = false)
	@Column(name = "id_sexo")
	public String getId_sexo() {
		return id_sexo;
	}

	public void setId_sexo(String id_sexo) {
		this.id_sexo = id_sexo;
	}

	// /////////////////////////d_sexo///////////////////////////
	@Basic(optional = false)
	@Column(name = "d_sexo")
	public String getD_sexo() {
		return d_sexo;
	}

	public void setD_sexo(String d_sexo) {
		this.d_sexo = d_sexo.trim().substring(0, 1).toUpperCase()
				+ d_sexo.substring(1);
	}

	// @OneToMany: (1:N) Asocia varios campos con uno
	// Multiplicidad 1:N Un genero tiene muchos empleados
	// @OneToMany(cascade = CascadeType.ALL, mappedBy = "genero" )
	// public List<Empleado> getEmpleadoList() {
	// return empleadoList;
	// }
	// public void setEmpleadoList(List<Empleado> empleadoList) {
	// this.empleadoList = empleadoList;
	// }

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "genero")
	public List<Usuario> getUsuarioList() {
		return usuarioList;
	}

	public void setUsuarioList(List<Usuario> usuarioList) {
		this.usuarioList = usuarioList;
	}

	// METODOS PARA AUDITORIA METODOS PARA AUDITORIA METODOS PARA AUDITORIA
	// METODOS PARA AUDITORIA METODOS PARA AUDITORIA

	@Basic(optional = false)
	@Column(name = "id_usuario_creador")
	public Short getUsuario_creador() {
		return id_usuario_creador;
	}

	public void setUsuario_creador(Short usuario_creador) {
		this.id_usuario_creador = usuario_creador;
	}

	@Basic(optional = false)
	@Column(name = "id_usuario_modifica")
	public Short getUsuario_modifica() {
		return id_usuario_modifica;
	}

	public void setUsuario_modifica(Short usuario_modifica) {
		this.id_usuario_modifica = usuario_modifica;
	}

	@Basic(optional = false)
	@Column(name = "fecha_creacion")
	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	@Basic(optional = false)
	@Column(name = "fecha_modifica")
	public Date getFecha_modifica() {
		return fecha_modifica;
	}

	public void setFecha_modifica(Date fecha_modifica) {
		this.fecha_modifica = fecha_modifica;
	}

	@Basic(optional = false)
	@Column(name = "activo")
	public Short getActive() {
		return activo;
	}

	public void setActive(Short activo) {
		this.activo = activo;
	}

	// FIN METODOS PARA AUDITORIA FIN METODOS PARA AUDITORIA FIN METODOS PARA
	// AUDITORIA FIN METODOS PARA AUDITORIA

}
