package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import utilidades.HibernateUtil;
import dominio.BoletaPago;
import dominio.Puesto;

public class BoletaPagoDAO {

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

	
	public void guardaActualiza(BoletaPago bp) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(bp);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	

	
	public BoletaPago daBoletaPagoById(short id_boletapago) {
		sesion = sessionFactory.openSession();
		// Retorna la instancia persistente de la clase por medio del atributo
		// identidad
		BoletaPago id = (BoletaPago) sesion.get(BoletaPago.class, new Short(id_boletapago));
		sesion.close();
		return id;
	}
	
	
	public BoletaPago daBoletaPagoByNombre(String periodo_pago) {
		sesion = sessionFactory.openSession();
		 Criteria criteria =
		 sesion.createCriteria(Puesto.class).add(Restrictions.like("periodo_pago", periodo_pago));
		 BoletaPago bp = (BoletaPago) criteria.uniqueResult();
		sesion.close();
		return bp;
	}
	
	public List<BoletaPago> daBoletaPago() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(BoletaPago.class).add(Restrictions.like("activo", Short.parseShort("1")));
		List<BoletaPago> bp = criteria.list();
		sesion.close();
		return bp;
	}

}
