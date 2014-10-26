package dao;

import javax.transaction.Transaction;
import org.apache.catalina.Session;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

import utilidades.HibernateUtil;

public class DepartamentoDAO {
	private HibernateUtil hibernateUtil = new HibernateUtil() ;
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;
	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession() ;
		tx = sesion.beginTransaction() ;
	}
	private void manejaExcepcion(HibernateException he) throws
	HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}
	public void guardaActualiza(Departamento departamento) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(departamento) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	public void eliminar(Departamento departamento) {
		try {
			iniciaOperacion() ;
			sesion.delete(departamento) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	public Departamento daDepartamentoById(short idDep){
		sesion = sessionFactory.openSession() ;
		// Retorna la instancia persistente de la clase por medio del
//		atributo identidad
		Departamento id = (Departamento) sesion.get(Departamento.class,
				new Short(idDep)) ;
		sesion.close() ;
		return id ;
	}
	public List<Departamento> daDepartamentos() {
		sesion = sessionFactory.openSession() ;
		Query query = sesion.getNamedQuery("Departamentos.findAll") ;
		List<Departamento> departamentos = query.list() ;
		sesion.close() ;
		return departamentos ;
	}
	public Departamento daDepartamentoByNombre(String nombre) {
		sesion = sessionFactory.openSession() ;
		Query query =
				sesion.getNamedQuery("Departamentos.findByNombreDep");
		query.setParameter("nombreDep", nombre);
		Departamento depto = (Departamento) query.uniqueResult();
		sesion.close() ;
		return depto ;
	}
}