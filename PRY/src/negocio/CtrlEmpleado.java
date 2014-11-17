package negocio;

import java.math.BigDecimal;
import java.util.Date;

import dao.EmpleadoDAO;
import dominio.Empleado;
import dominio.Genero;
import dominio.Oficina;
import dominio.Puesto;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmp = new EmpleadoDAO();

	public boolean crearEmpleado(String nombres, String apellidoPaterno,
			String apellidoMaterno, Genero genero, Date fechaNacimiento,
			Date fechaIngreso, String dui, String nit, String telefono,
			String email, Oficina oficina, String jefe, BigDecimal sueldo, String activo, Puesto puesto, short id_usuario) {
		if (daoEmp.daEmpleadoByDUI(dui) == null) {
			Empleado empleado = new Empleado(nombres, apellidoPaterno,
					apellidoMaterno, genero, fechaNacimiento, fechaIngreso,
					dui, nit, telefono, email, oficina, jefe, sueldo, activo, puesto);
			String id = daoEmp.dameAlgunIdParaEmpleado();
			empleado.setIdEmpleado(id);
			
			//ESTABLECE LOS VALORES PARA AUDITORIA
			empleado.setUsuario_creador(id_usuario);
			empleado.setUsuario_modifica(id_usuario);
			empleado.setFecha_creacion(new Date());
			empleado.setFecha_modifica(new Date());
			daoEmp.guardaActualiza(empleado);
			return true;
		} else
			return false;
	}
	
	public boolean modificarEmpleado(String nombres, String apellidoPaterno,
			String apellidoMaterno, Genero genero, Date fechaNacimiento,
			Date fechaIngreso, String dui, String nit, String telefono,
			String email, Oficina oficina, String jefe, BigDecimal sueldo, String activo, Puesto puesto, short id_usuario) {
		if (daoEmp.daEmpleadoByDUI(dui) != null) {
			Empleado empleado = daoEmp.daEmpleadoByDUI(dui);
			empleado.setNombres(nombres);
			empleado.setApellidoPaterno(apellidoPaterno);
			empleado.setApellidoMaterno(apellidoMaterno);
			empleado.setGenero(genero);
			empleado.setFechaNacimiento(fechaNacimiento);
			empleado.setFechaIngreso(fechaIngreso);
			empleado.setDui(dui);
			empleado.setNit(nit);
			empleado.setTelefono(telefono);
			empleado.setEmail(email);
			empleado.setOficina(oficina);
			empleado.setIdJefe(jefe);
			empleado.setSueldo(sueldo);
			empleado.setActivo(activo);
			empleado.setPuesto(puesto);
			
			//ESTABLECE LOS VALORES PARA AUDITORIA
			empleado.setUsuario_modifica(id_usuario);
			empleado.setFecha_modifica(new Date());
			daoEmp.guardaActualiza(empleado);
			return true;
		} else
			return false;
	}
	
	public boolean eliminarEmpleado(String idEmpleado,String id_usuario,Short activo) {
		if(daoEmp.daoEmpleadoById(idEmpleado) != null) {
			Empleado empleado =	daoEmp.daoEmpleadoById(idEmpleado);
			empleado.setUsuario_modifica(Short.parseShort(id_usuario));
			empleado.setFecha_modifica(new Date());
			empleado.setActive(activo);
			daoEmp.guardaActualiza(empleado) ;
			return true ;
		}
		else
			return false ;
	}
}
