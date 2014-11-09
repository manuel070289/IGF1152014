package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import dominio.Genero;
import dominio.Usuario;

import utilidades.HibernateUtil;
public class UsuarioDAO {
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
	
	public void guardaActualiza(Usuario usuario){
		try{
			iniciaOperacion();
			sesion.saveOrUpdate(usuario) ; 
			tx.commit() ; 
			sesion.flush() ; 
		 }catch(HibernateException he){
			manejaExcepcion(he) ; 
			throw he ; 
		 }finally{ 
			sesion.close() ;  
		}
	} 
	public void eliminar(Usuario usuario) { 
		try{ 
			iniciaOperacion() ; 
			sesion.delete(usuario) ; 
			tx.commit() ; 
			sesion.flush() ; 
		 }catch(HibernateException he) { 
			manejaExcepcion(he) ; 
		throw he ; 
		} finally{ 
			sesion.close() ;  
		}  
	}
	
	public Usuario daoUsuarioById(Integer idUsuario){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Usuario.class).add(Restrictions.eq("id_usuario", idUsuario));
		Usuario usuario = (Usuario)var.uniqueResult() ;
		sesion.close() ;
		return usuario ;
	}
	
	public Usuario daoUsuarioByNombre(String nombre) {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Usuario.class).add(Restrictions.like("nombre",nombre)); 
		Usuario ofic = (Usuario) criteria.uniqueResult(); 
		sesion.close() ; 
		return ofic ; 
	}
	
	public Usuario daoUsuarioByApellido(String apellido) {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Usuario.class).add(Restrictions.like("apellido",apellido)); 
		Usuario ofic = (Usuario) criteria.uniqueResult(); 
		sesion.close() ; 
		return ofic ; 
	}
	
	public Usuario daoUsuarioByNombreYApellido(String nombre,String apellido) {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Usuario.class)
				.add(Restrictions.like("nombre",nombre))
				.add(Restrictions.like("apellido",apellido)); 
		Usuario ofic = (Usuario) criteria.uniqueResult(); 
		sesion.close() ; 
		return ofic ; 
	}
	
	public List<Usuario> daoUsuario(){
		sesion = sessionFactory.openSession() ;
		Criteria var = sesion.createCriteria(Usuario.class);
		List<Usuario> usuario = var.list() ;
		sesion.close() ;
		return usuario ;
	}
	
	public List<Usuario> daoUsuarioByGenero(String genero){
		sesion = sessionFactory.openSession() ;
		Criteria gen = sesion.createCriteria(Genero.class).add(Restrictions.eq("id_sexo", genero));
		Genero gene = (Genero) gen.uniqueResult();
		
		Criteria var = sesion.createCriteria(Usuario.class).add(Restrictions.eq("id_sexo", gene));
		List<Usuario> usuario = var.list();
		sesion.close() ;
		return usuario ;
	}
}
