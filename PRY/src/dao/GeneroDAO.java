package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import dominio.Empleado;
import dominio.Genero;

import utilidades.HibernateUtil;

public class GeneroDAO {
	private HibernateUtil hibernateUtil = new HibernateUtil();
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}

	public void guardaActualiza(Genero genero) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(genero);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public Genero daGeneroByDefinicion(String definicion) {
		definicion = definicion.trim().substring(0,1).toUpperCase() + definicion.substring(1);	
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Genero.class).add(Restrictions.like("d_sexo",definicion));
		Genero genero = (Genero) criteria.uniqueResult();
		sesion.close();
		return genero;
	}

	public Genero daGeneroById(String id) {
		id = id.trim().substring(0,1).toUpperCase() + id.substring(1);	
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Genero.class).add(Restrictions.eq("id_sexo",id));
		Genero genero = (Genero) criteria.uniqueResult();
		sesion.close();
		return genero;
	}

	public List<Genero> dameTodosLosGeneros() {
		sesion = sessionFactory.openSession();
		Criteria criteria = sesion.createCriteria(Genero.class).add(Restrictions.like("active",Short.parseShort("1")));
		List<Genero> listadoDeGeneros = criteria.list();
		sesion.close();
		return listadoDeGeneros;
	}

	//Este metodo otorga un nuevo id para usarlo como llave primaria en Empleado
	public String dameAlgunIdParaGenero() {
		sesion= sessionFactory.openSession() ;
		Criteria criteria = sesion.createCriteria(Genero.class).addOrder(Order.desc("id_sexo")).setMaxResults(1); 
		Genero genero = (Genero) criteria.uniqueResult();

		char id;
		if(genero == null)
			return "0";		

		if(genero.getId_sexo().equals("9"))
			return "A";
		if(genero.getId_sexo().equals("Z"))
			return "a";
		else
			id = genero.getId_sexo().charAt(0);

		return String.valueOf(Character.toChars(id + 1));
	}
}
