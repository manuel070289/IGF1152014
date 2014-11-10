package utilidades;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {
	
	private static final SessionFactory sessionFactory;  
	  
    static {  
        try {  
            // Create the SessionFactory from hibernate.cfg.xml  
            sessionFactory = new Configuration().configure().buildSessionFactory();  
        } catch (Throwable ex) {  
            // Make sure you log the exception, as it might be swallowed  
            System.err.println("Initial SessionFactory creation failed." + ex);  
            throw new ExceptionInInitializerError(ex);  
        }  
    }  
  
    public static SessionFactory getSessionFactory() {  
        return sessionFactory;  
    }  
    /*
     * ESTE METODO NO SIRVE PORQUE CREA MULTIPLES SESIONES HASTA LLEGAR AL LIMITE ACEPTADO POR MYSQL
     * 
    private static SessionFactory sessionFactory;
    
    public HibernateUtil(){ 
        try {
        	Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);          
        } catch (Throwable e) {
        	System.err.println("Error in creating SessionFactory object." 
                    + e.getMessage());
            throw new ExceptionInInitializerError(e);
        }
    }
        
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }*/
}
