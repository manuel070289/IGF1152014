package negocio;

import java.math.BigDecimal;
import java.util.Date;

import dao.EmpleadoDAO;
import dominio.Empleado;

public class CtrlEmpleado {
	private EmpleadoDAO daoEmp = new EmpleadoDAO();
	
	public boolean crearEmpleado(String nombres, String apellidoPaterno, String apellidoMaterno, Date fechaNacimiento, String dui, String nit) {
		if (daoEmp.daEmpleadoByDUI(dui) == null) {
				Empleado empleado = new Empleado(nombres, apellidoPaterno, apellidoMaterno, fechaNacimiento, dui, nit);
				empleado.setIdEmpleado("2");
				daoEmp.guardaActualiza(empleado);
				return true;
		} else
			return false;
	}
}
