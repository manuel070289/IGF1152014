package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import utilidades.HibernateUtil;
import dominio.BoletaPagoDescuento;
import dominio.Empleado;

public class BoletaPagoDescuentoDAO {
private HibernateUtil hibernateUtil = new HibernateUtil() ;
	
	public void guarda(BoletaPagoDescuento BPD){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		//3. Obtengo la Transaccion
		Transaction tx = sesion.beginTransaction();
		//4. Guardo el tipo descuentos
		sesion.save(BPD);
		//5. Guardo los cambios del tipo descuentos
		tx.commit();
		sesion.flush();
		//6. Cierro la sesion
		sesion.close();
	}
	
	public void actualizar(BoletaPagoDescuento BPD) {
	    // 1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
	    sesion.update(BPD) ;
	    // 5. Guardo los Cambios del tipo descuentos
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
   }
	
	public void eliminar(BoletaPagoDescuento BPD) {
	    // 1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
	    sesion.delete(BPD) ;
	    // 5. Guardo los Cambios del tipo descuentos
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
   }
	
	public BoletaPagoDescuento obtenerBoletaPagoDescuento(int idBPD){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		
			sesion = sessionFactory.openSession();
			Criteria criteria = sesion.createCriteria(BoletaPagoDescuento.class).add(Restrictions.like("idBoletapagosdescuento",idBPD));
			BoletaPagoDescuento BP = (BoletaPagoDescuento) criteria.uniqueResult();
			sesion.close();
			return BP;
	

	}
		public List<BoletaPagoDescuento> findAll(){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(BoletaPagoDescuento.class).add(Restrictions.eq("active",Short.parseShort("1")));;
		List<BoletaPagoDescuento> listadoBoleta = criteria.list();
		sesion.close();
		return listadoBoleta;
	
	}
	public List<BoletaPagoDescuento> findByExample(BoletaPagoDescuento filters){		
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		// 2. Obtengo la Session
		Session sesion = sessionFactory.openSession() ;
		// 3. Obtengo la Transaccion
		Transaction tx = sesion.beginTransaction() ;
		// 4. Actualizo el tipo descuentos
		List<BoletaPagoDescuento> u=this.findByExample(filters);
		tx.commit();
		return u;
		
	}


}
