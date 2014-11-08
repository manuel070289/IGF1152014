package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import dominio.Departamento;
import dominio.Municipio;

import utilidades.HibernateUtil;


public class MunicipioDAO {
	


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
	public void guardaActualiza(Municipio municipio) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(municipio) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	public void eliminar(Municipio municipio) {
		try {
			iniciaOperacion() ;
			sesion.delete(municipio) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	public Municipio daMunicipioById(String id_municipio){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Municipio.class).add(Restrictions.eq("id_municipio", id_municipio));
		Municipio municipio = (Municipio)var.uniqueResult();
		sesion.close() ;
		return municipio ;
	}
	
	public List<Municipio> daMunicipios() {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findAll") ;
		Criteria var = sesion.createCriteria(Municipio.class);
		List<Municipio> municipios = var.list() ;
		sesion.close() ;
		return municipios ;
	}
	public Municipio daMunicipioByNombre(String nomb_municipio) {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findByNombreDep");
//		query.setParameter("nombreDep", nombre);
		Criteria var = sesion.createCriteria(Municipio.class).add(Restrictions.eq("nomb_municipio",nomb_municipio));
		Municipio depto = (Municipio) var.uniqueResult();
		sesion.close() ;
		return depto ;
	}
	
	
	public List<Municipio> daMunicipioByDepto(String id_depto) {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findByNombreDep");
//		query.setParameter("nombreDep", nombre);
		Criteria dep = sesion.createCriteria(Departamento.class).add(Restrictions.eq("id_depto", id_depto));
		Departamento depar = (Departamento) dep.uniqueResult(); 
		Criteria var = sesion.createCriteria(Municipio.class).add(Restrictions.eq("departamento",depar));
		List<Municipio> munis =  var.list();
		sesion.close() ;
		return munis ;
	}




}
