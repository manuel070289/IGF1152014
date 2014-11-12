package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import utilidades.HibernateUtil;
import dominio.BoletaPago;

public class BoletaPagoDAO {
private HibernateUtil hibernateUtil = new HibernateUtil() ;
	
	public void guardar(BoletaPago BP){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		//3. Obtengo la Transaccion
		Transaction tx = sesion.beginTransaction();
		//4. Guardo el tipo descuentos
		sesion.save(BP);
		//5. Guardo los cambios del tipo descuentos
		tx.commit();
		sesion.flush();
		//6. Cierro la sesion
		sesion.close();
	}
	
	public void actualizar(BoletaPago BP) {
	    // 1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
	    sesion.update(BP) ;
	    // 5. Guardo los Cambios del tipo descuentos
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
   }
	
	public void eliminar(BoletaPago BP) {
	    // 1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	    // 2. Obtengo la Session
	    Session sesion = sessionFactory.openSession() ;
	    // 3. Obtengo la Transaccion
	    Transaction tx = sesion.beginTransaction() ;
	    // 4. Actualizo el tipo descuentos
	    sesion.delete(BP) ;
	    // 5. Guardo los Cambios del tipo descuentos
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
   }
	
	public BoletaPago obtenerBoletaPago(short idBP){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		Query query = sesion.getNamedQuery("daBoletaPagoPorId");
		query.setShort("id_BoletaPago",idBP);
		List BP = query.list();
		sesion.close();
		if (BP.isEmpty()){
			return null;
		}else{
			return (BoletaPago)BP.get(0);
		}

	}
	
	
	public List<BoletaPago> findAll(){
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		//2. Obtengo la Session
		Session sesion = sessionFactory.openSession();
		Query query = sesion.getNamedQuery("buscarTodosBP");
		//query.setString();
		List BP = query.list();
		sesion.close();
		if (BP.isEmpty()){
					return null;
		}else{
			return BP;
		}
	}
	public List<BoletaPago> findByExample(BoletaPago filters){		
		//1. Obtengo la SessionFactory
		SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
		// 2. Obtengo la Session
		Session sesion = sessionFactory.openSession() ;
		// 3. Obtengo la Transaccion
		Transaction tx = sesion.beginTransaction() ;
		// 4. Actualizo el tipo descuentos
		List<BoletaPago> u=this.findByExample(filters);
		tx.commit();
		return u;
		
	}

}
