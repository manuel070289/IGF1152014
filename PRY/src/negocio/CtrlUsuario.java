package negocio;
import java.util.List;

import dominio.*;
import dao.*;
public class CtrlUsuario {
	private UsuarioDAO daoUsuario=new UsuarioDAO();
	
	
	public boolean modificarOficina(Short idUsuario, String nombre, String apellido,Genero genero) {
		if(daoUsuario.daoUsuarioByNombre(nombre) != null) {
			Usuario usuario =	daoUsuario.daoUsuarioById(idUsuario) ;
			usuario.setNombre(nombre);
			usuario.setApellido(apellido);
			usuario.setGenero(genero);
			daoUsuario.guardaActualiza(usuario) ;
			return true ;
		}
		else
			return false ;
	}
	
	public List<Usuario> daoUsuario(){
		return daoUsuario.daoUsuario() ;
	}
	public Usuario daoUsuarioById(Short idUsuario) {
		return daoUsuario.daoUsuarioById(idUsuario) ;
	}
	
	public Usuario daoUsuarioByUserPass(String user,String pass) {
		return daoUsuario.daoUsuarioByUserPass(user,pass) ;
	}
	public Usuario daoUsuarioByNombre(String nombre) {
		return daoUsuario.daoUsuarioByNombre(nombre) ;
	}
	
	public Usuario daoUsuarioByApellido(String apellido) {
		return daoUsuario.daoUsuarioByApellido(apellido) ;
	}
	public Usuario daoUsuarioByNombreYApellido(String nombre,String apellido) {
		return daoUsuario.daoUsuarioByNombreYApellido(nombre,apellido) ;
	}
	public List<Usuario> daoUsuarioByGenero(String genero){
		return daoUsuario.daoUsuarioByGenero(genero);
	}
}
