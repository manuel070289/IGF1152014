package dao;

//import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import com.sun.xml.internal.org.jvnet.fastinfoset.sax.RestrictedAlphabetContentHandler;
//import org.hibernate.Criteria;
//import org.hibernate.HibernateException;
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.criterion.Restrictions;
import dominio.BoletaPago;
import dominio.Departamento;
import dominio.Empleado;
import utilidades.HibernateUtil;

public class BoletaPagoDAO {
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
///////////////////////////FUNCIONES///////////////////////////
	//////Guarda una nueva BoletaPago
	public void guardaActualiza(BoletaPago boleta) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(boleta) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	
	////Elimina una BoletaPago
	public void eliminar(BoletaPago boleta) {
		try {
			iniciaOperacion() ;
			sesion.delete(boleta) ;
			tx.commit() ;
			sesion.flush() ;
		} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
		} finally {
			sesion.close() ;
		}
	}
	
	
	
	
	
	//////Verifica si existe la BoletaPago por periodo y id_empleado
	public BoletaPago daBoletaPagoByPeriodoPagoyIdEMpleado(String periodo, Empleado empleado){
		sesion = sessionFactory.openSession();
		Criteria var = sesion.createCriteria(BoletaPago.class).add(Restrictions.eq("periodo",periodo)).add(Restrictions.eq("id_empleado", empleado));
		BoletaPago bol = (BoletaPago)var.uniqueResult();
		return bol;
	}
	
	
	
	

	
	
	
}
