package dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import dominio.Municipio;
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
	
	public String daoLastId(){
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Oficina.class)
				.addOrder(Order.desc("id_oficina"))
				.setMaxResults(1); 
		Oficina ofic = (Oficina) criteria.uniqueResult();
		String numeroN="";
		if(ofic==null)
			return "O0001";
		else
		{
			Integer numero=Integer.parseInt(ofic.getId_oficina().substring(1));
			numero++;
			if(numero<10)
				numeroN="O000"+numero;
			if(numero>9 && numero<100)
				numeroN="O00"+numero;
			if(numero>99 && numero<1000)
				numeroN="O0"+numero;
			if(numero>999)
				numeroN="O"+numero;
		}
		sesion.close(); 
		return numeroN;
		
	}
	
	public Oficina daoNombreOficina(String nomb_oficina) {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Oficina.class).add(Restrictions.eq("nomb_oficina",nomb_oficina)); 
		Oficina ofic = (Oficina) criteria.uniqueResult();
		sesion.close() ; 
		return ofic ; 
	}
	
	public List<Oficina> daoOficina(){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Oficina.class).add(Restrictions.like("activo",Short.parseShort("1")));
		List<Oficina> oficina = var.list() ;
		sesion.close() ;
		return oficina ;
	}
	
	public Oficina daoOficinaById(String idOficina){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Oficina.class).add(Restrictions.eq("id_oficina", idOficina));
		Oficina oficina = (Oficina)var.uniqueResult() ;
		sesion.close() ;
		return oficina ;
	}
	
	public Oficina daoOficinaByNombre(String nombOficina){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Oficina.class).add(Restrictions.eq("nomb_oficina", nombOficina));
		Oficina oficina = (Oficina) var.uniqueResult();
		sesion.close() ;
		return oficina ;
	}
	
	public List<Oficina> daoOficinaByMun(String idMunicipio){
		sesion = sessionFactory.openSession() ;
		Criteria mun = sesion.createCriteria(Municipio.class).add(Restrictions.eq("id_municipio", idMunicipio));
		Municipio municipio = (Municipio) mun.uniqueResult();
		
		Criteria var = sesion.createCriteria(Oficina.class).add(Restrictions.eq("municipio", municipio));
		List<Oficina> oficina = var.list();
		sesion.close() ;
		return oficina ;
	}
	
}
