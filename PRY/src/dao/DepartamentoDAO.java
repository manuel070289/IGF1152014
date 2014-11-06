package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import utilidades.HibernateUtil;
import dominio.Departamento;
import dominio.Municipio;

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
	
	
	public void Actualiza(Departamento departamento) {
		try {
			iniciaOperacion() ;
			sesion.update(departamento) ;
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
	public Departamento daDepartamentoById(String id_depto){
		sesion = sessionFactory.openSession() ;
//		 Retorna la instancia persistente de la clase por medio del atributo identidad
		/*Departamento id = (Departamento) sesion.get(Departamento.class,	new String(id_depto)) ;*/
		Criteria var = sesion.createCriteria(Departamento.class).add(Restrictions.eq("id_depto", id_depto));
		Departamento dep = (Departamento)var.uniqueResult();
		sesion.close() ;
		/*return id ;*/
		return dep ;
	}
	public List<Departamento> daDepartamentos() {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findAll") ;
		Criteria var = sesion.createCriteria(Departamento.class);
		List<Departamento> departamentos = var.list() ;
		sesion.close() ;
		return departamentos ;
	}
	public Departamento daDepartamentoByNombre(String nombre_depto) {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findByNombreDep");
//		query.setParameter("nombreDep", nombre);
		Criteria var = sesion.createCriteria(Departamento.class).add(Restrictions.eq("nombre_depto",nombre_depto));
		Departamento depto = (Departamento) var.uniqueResult();
		sesion.close() ;
		return depto ;
	}
	
	
	public List<Departamento> daDepartamentoByZona(String zona_geografica) {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findAll") ;
		Criteria var = sesion.createCriteria(Departamento.class).add(Restrictions.eq("zona_geografica",zona_geografica));
		List<Departamento> departamentos = var.list() ;
		sesion.close() ;
		return departamentos ;
	}
	
	public ArrayList<Municipio> daMunicipiobyDepto(String id_depto) {
		sesion = sessionFactory.openSession() ;
//		Query query = sesion.getNamedQuery("Departamentos.findAll") ;
		Criteria var = sesion.createCriteria(Departamento.class).add(Restrictions.eq("id_depto",id_depto));
		/*Departamento depto = (Departamento) var.uniqueResult();*/
		ArrayList<Municipio> municipioList = (ArrayList<Municipio>) var.list();
		sesion.close() ;
		return municipioList ;
	}

}
