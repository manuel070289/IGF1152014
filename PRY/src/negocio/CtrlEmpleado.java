package negocio;

import java.util.Date;

import dao.EmpleadoDAO;
import dominio.Empleado;
import dominio.Genero;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmp = new EmpleadoDAO();
	
	public boolean crearEmpleado(String nombres, String apellidoPaterno, String apellidoMaterno, Genero genero, Date fechaNacimiento, Date fechaIngreso, String dui, String nit, String telefono, String email) {
		if (daoEmp.daEmpleadoByDUI(dui) == null) {
				Empleado empleado = new Empleado(nombres, apellidoPaterno, apellidoMaterno, genero, fechaNacimiento, fechaIngreso, dui, nit, telefono, email);
				empleado.setIdEmpleado("2");
				daoEmp.guardaActualiza(empleado);
				return true;
		} else
			return false;
	}
}
