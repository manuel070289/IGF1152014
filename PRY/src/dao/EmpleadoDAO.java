package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import dominio.Empleado;
import dominio.Genero;
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
		Criteria criteria = sesion.createCriteria(Empleado.class);
		List<Empleado> listadoDeEmpleados = criteria.list();
		sesion.close();
		return listadoDeEmpleados;
	}
}
