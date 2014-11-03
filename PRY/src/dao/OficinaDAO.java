package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
	
}
