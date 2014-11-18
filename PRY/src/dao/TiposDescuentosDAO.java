package dao;
import java.util.*;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;


import utilidades.HibernateUtil;
import dominio.*;


public class TiposDescuentosDAO {
private HibernateUtil hibernateUtil = new HibernateUtil() ;
	
	public void guarda(TiposDescuentos TD){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		//3. Obtengo la Transaccion
		Transaction tx = sesion.beginTransaction();
		//4. Guardo el tipo descuentos
		sesion.save(TD);
		//5. Guardo los cambios del tipo descuentos
		tx.commit();
		sesion.flush();
		//6. Cierro la sesion
		sesion.close();
	}
	
	public void actualizar(TiposDescuentos TD) {
	    // 1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
	    sesion.update(TD) ;
	    // 5. Guardo los Cambios del tipo descuentos
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
   }
	
	public void eliminar(TiposDescuentos TD) {
	    // 1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
	    sesion.delete(TD) ;
	    // 5. Guardo los Cambios del tipo descuentos
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
   }
	
	public TiposDescuentos obtenerTipoDescuento(String idTD){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(TiposDescuentos.class).add(Restrictions.like("idTiposdescuentos",idTD));
		TiposDescuentos TiposDes = (TiposDescuentos) criteria.uniqueResult();
		sesion.close();
		return TiposDes;

	}
	public TiposDescuentos get(String key){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
		
		TiposDescuentos u=this.get(key);
		tx.commit();
		return u;
	}
	public List<TiposDescuentos> findAll(){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(TiposDescuentos.class);
		List<TiposDescuentos> listadoDes = criteria.list();
		sesion.close();
		return listadoDes;
	}
	public List<TiposDescuentos> findActivos(){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(TiposDescuentos.class).add(Restrictions.eq("activo",Integer.parseInt("1")));;
		List<TiposDescuentos> listadoDes = criteria.list();
		sesion.close();
		return listadoDes;
	}
	public List<TiposDescuentos> findByExample(TiposDescuentos filters){		
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		// 2. Obtengo la Session
		Session sesion = sessionFactory.openSession() ;
		// 3. Obtengo la Transaccion
		Transaction tx = sesion.beginTransaction() ;
		// 4. Actualizo el tipo descuentos
		List<TiposDescuentos> u=this.findByExample(filters);
		tx.commit();
		return u;
		
	}

}
