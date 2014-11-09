package negocio;

import java.math.BigDecimal;
import java.util.Date;

import dao.EmpleadoDAO;
import dominio.Empleado;
import dominio.Genero;
import dominio.Oficina;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmp = new EmpleadoDAO();

	public boolean crearEmpleado(String nombres, String apellidoPaterno,
			String apellidoMaterno, Genero genero, Date fechaNacimiento,
			Date fechaIngreso, String dui, String nit, String telefono,
			String email, Oficina oficina, String jefe, BigDecimal sueldo, String activo, short puesto, short id_usuario) {
		if (daoEmp.daEmpleadoByDUI(dui) == null) {
			Empleado empleado = new Empleado(nombres, apellidoPaterno,
					apellidoMaterno, genero, fechaNacimiento, fechaIngreso,
					dui, nit, telefono, email, oficina, jefe, sueldo, activo, puesto);
			empleado.setIdEmpleado("2");
			
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
}
