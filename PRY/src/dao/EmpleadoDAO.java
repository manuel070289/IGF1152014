package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import dominio.Empleado;
import dominio.Genero;
import dominio.Oficina;
import utilidades.HibernateUtil;

public class EmpleadoDAO {
	private HibernateUtil hibernateUtil = new HibernateUtil();
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}

	public void guardaActualiza(Empleado empleado) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(empleado);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public Empleado daEmpleadoByDUI(String dui) {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Empleado.class).add(Restrictions.like("dui",dui));
		Empleado empleado = (Empleado) criteria.uniqueResult();
		sesion.close();
		return empleado;
	}

	public List<Empleado> dameTodosLosEmpleados() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Empleado.class).add(Restrictions.eq("active",Short.parseShort("1")));;
		List<Empleado> listadoDeEmpleados = criteria.list();
		sesion.close();
		return listadoDeEmpleados;
	}

	public Empleado daoEmpleadoById(String idEmpleado){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Empleado.class).add(Restrictions.eq("idEmpleado", idEmpleado));
		Empleado empleado = (Empleado)var.uniqueResult() ;
		sesion.close();
		return empleado;
	}

	//Este metodo otorga un nuevo id para usarlo como llave primaria en Empleado
	public String dameAlgunIdParaEmpleado() {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Empleado.class).addOrder(Order.desc("idEmpleado")).setMaxResults(1); 
		Empleado empleado = (Empleado) criteria.uniqueResult();
		String numeroN="";
		if(empleado == null)
			return "E0001";
		else
		{
			Integer numero = Integer.parseInt(empleado.getIdEmpleado().substring(1));
			numero++;
			if(numero < 10)
				numeroN = "E000"+ numero;
			if(numero > 9 && numero < 100)
				numeroN = "E00" + numero;
			if(numero > 99 && numero < 1000)
				numeroN = "E0" + numero;
			if(numero > 999)
				numeroN = "E" + numero;
		}
		sesion.close(); 
		return numeroN;		
	}
}
