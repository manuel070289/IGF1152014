package dominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


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
	private String idOficina;
	private String idSexo;
	
	public Empleado () {
		
	}
	
	public Empleado(String nombres, String apellPaterno, String apellMaterno, Date fechaNacimiento, String dui, String nit) {
		this.nombres = nombres;
		this.apellidoPaterno = apellPaterno;
		this.apellidoMaterno = apellMaterno;
		this.fechaNacimiento = fechaNacimiento;
		this.dui = dui;
		this.nit = nit;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public BigDecimal getSueldo() {
		return sueldo;
	}

	public void setSueldo(BigDecimal sueldo) {
		this.sueldo = sueldo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = activo;
	}
	
	
}
