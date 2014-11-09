package dominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "empleado", catalog = "igf2014", schema = "")
public class Empleado implements Serializable {

	private static final long serialVersionUID = 1L;
	private String idEmpleado;
	private String nit;
	private String dui;
	private String nombres;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private Date fechaNacimiento;
	private Date fechaIngreso;
	private BigDecimal sueldo;
	private String email;
	private String telefono;
	private String activo;
	private String idJefe;
	private short idPuesto;
	private Oficina oficina;
	private Genero genero;
	
	
	//CAMPOS PARA AUDITORIA
	private Short id_usuario_creador;
	private Short id_usuario_modifica;
	private Date fecha_creacion;
	private Date fecha_modifica;
	private Short active;

	public Empleado() {

	}

	public Empleado(String nombres, String apellPaterno, String apellMaterno,
			Genero genero, Date fechaNacimiento, Date fechaIngreso, String dui,
			String nit, String telefono, String email, Oficina oficina,
			String jefe, BigDecimal sueldo, String activo, short puesto) {
		this.nombres = nombres;
		this.apellidoPaterno = apellPaterno;
		this.apellidoMaterno = apellMaterno;
		this.genero = genero;
		this.fechaNacimiento = fechaNacimiento;
		this.fechaIngreso = fechaIngreso;
		this.dui = dui;
		this.nit = nit;
		this.telefono = telefono;
		this.email = email;
		this.oficina = oficina;
		this.idJefe = jefe;
		this.sueldo = sueldo;
		this.activo = activo;
		this.idPuesto = puesto;
		
		this.active = 1;
	}

	@Id
	@Basic(optional = false)
	@Column(name = "id_empleado")
	public String getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(String idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	@Basic(optional = false)
	@Column(name = "nit")
	public String getNit() {
		return nit;
	}

	public void setNit(String nit) {
		this.nit = nit;
	}

	@Basic(optional = false)
	@Column(name = "dui")
	public String getDui() {
		return dui;
	}

	public void setDui(String dui) {
		this.dui = dui;
	}

	@Basic(optional = false)
	@Column(name = "nombres")
	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	@Basic(optional = false)
	@Column(name = "apellido_paterno")
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	@Basic(optional = false)
	@Column(name = "apellido_materno")
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	@Basic(optional = false)
	@Column(name = "fecha_nacimiento")
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	@Basic(optional = false)
	@Column(name = "fecha_ingreso")
	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	@Basic(optional = false)
	@Column(name = "sueldo")
	public BigDecimal getSueldo() {
		return sueldo;
	}

	public void setSueldo(BigDecimal sueldo) {
		this.sueldo = sueldo;
	}

	@Basic(optional = false)
	@Column(name = "e_mail")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Basic(optional = false)
	@Column(name = "telefono")
	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Basic(optional = false)
	@Column(name = "activo")
	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = activo;
	}

	@ManyToOne(optional = false)
	@JoinColumn(name = "id_sexo", referencedColumnName = "id_sexo")
	public Genero getGenero() {
		return genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	@ManyToOne(optional = false)
	@JoinColumn(name = "id_oficina", referencedColumnName = "id_oficina")
	public Oficina getOficina() {
		return oficina;
	}

	public void setOficina(Oficina oficina) {
		this.oficina = oficina;
	}
	
	@Basic(optional = true)
	@Column(name = "id_jefe")
	public String getIdJefe() {
		return idJefe;
	}

	public void setIdJefe(String idJefe) {
		this.idJefe = idJefe;
	}
	
	@Basic(optional = false)
	@Column(name = "id_puesto")
	public short getIdPuesto() {
		return idPuesto;
	}

	public void setIdPuesto(short idPuesto) {
		this.idPuesto = idPuesto;
	}
	
	//METODOS PARA AUDITORIA METODOS PARA AUDITORIA METODOS PARA AUDITORIA METODOS PARA AUDITORIA METODOS PARA AUDITORIA
	
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
	@Column(name="active")
	public Short getActive() {
		return active;
	}

	public void setActive(Short activo) {
		this.active = activo;
	} 
	
	//FIN METODOS PARA AUDITORIA FIN METODOS PARA AUDITORIA FIN METODOS PARA AUDITORIA FIN METODOS PARA AUDITORIA
}
