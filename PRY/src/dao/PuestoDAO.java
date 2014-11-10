package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import dominio.Puesto;
import utilidades.HibernateUtil;

public class PuestoDAO {
	
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
	
	public void guardaActualiza(Puesto ps) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(ps);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	public void eliminar(Puesto ps) {
		try {
			iniciaOperacion();
			sesion.delete(ps);
			tx.commit();

			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	public Puesto daPuestoById(short id_puesto) {
		sesion = sessionFactory.openSession();
		// Retorna la instancia persistente de la clase por medio del atributo
		// identidad
		Puesto id = (Puesto) sesion.get(Puesto.class, new Short(id_puesto));
		sesion.close();
		return id;
	}
	
	public Puesto daPuestoByNombre(String nomb_puesto) {
		sesion = sessionFactory.openSession();
		 Criteria criteria =
		 sesion.createCriteria(Puesto.class).add(Restrictions.like("nomb_puesto", nomb_puesto));
		Puesto ps = (Puesto) criteria.uniqueResult();
		sesion.close();
		return ps;
	}
	
	public List<Puesto> daPuesto() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Puesto.class).add(Restrictions.like("activo", Short.parseShort("1")));
		List<Puesto> ps = criteria.list();
		sesion.close();
		return ps;
	}

}
