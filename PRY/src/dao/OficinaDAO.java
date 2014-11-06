package dao;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import dominio.Oficina;

import utilidades.HibernateUtil;

public class OficinaDAO {
	private HibernateUtil hibernateUtil = new HibernateUtil() ;
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;
	
	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession() ;
		tx = sesion.beginTransaction() ;
	}
	
	private void manejaExcepcion(HibernateException he) throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}
	
	public void guardaActualiza(Oficina oficina){
		try{
			iniciaOperacion();
			sesion.saveOrUpdate(oficina) ; 
			tx.commit() ; 
			sesion.flush() ; 
		 }catch(HibernateException he){
			manejaExcepcion(he) ; 
			throw he ; 
		 }finally{ 
			sesion.close() ;  
		}
	} 
	public void eliminar(Oficina oficina) { 
		try{ 
			iniciaOperacion() ; 
			sesion.delete(oficina) ; 
			tx.commit() ; 
			sesion.flush() ; 
		 }catch(HibernateException he) { 
			manejaExcepcion(he) ; 
		throw he ; 
		} finally{ 
			sesion.close() ;  
		}  
	}
	
	public Oficina daNombreOficina(String nombre) {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Oficina.class).add(Restrictions.like("nomb_oficina",nombre)); 
		Oficina ofic = (Oficina) criteria.uniqueResult(); 
		sesion.close() ; 
		return ofic ; 
	}
	
}
