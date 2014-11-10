package negocio;
import java.util.List;

import dominio.*;
import dao.*;
public class CtrlUsuario {
	private UsuarioDAO daoUsuario=new UsuarioDAO();
	
	
	public boolean crearUsuario(String nombre, String apellido,Genero genero,String username,String passwd,Short rol) {
		if(daoUsuario.daoUsuarioByNombre(nombre) == null) {
			Usuario usuario =	new Usuario(nombre,apellido,genero,username,passwd,rol) ;
			daoUsuario.guardaActualiza(usuario) ;
			return true ;
		}
		else
			return false ;
	}
	
	public boolean modificarUsuario(Short id_usuario,String nombre, String apellido,Genero genero,String username,String passwd,Short rol) {
		if(daoUsuario.daoUsuarioById(id_usuario) != null) {
			Usuario usuario =	daoUsuario.daoUsuarioById(id_usuario);
			usuario.setNombre(nombre);
			usuario.setApellido(apellido);
			usuario.setGenero(genero);
			usuario.setUsername(username);
			usuario.setPasswd(passwd);
			usuario.setRol(rol);
			daoUsuario.guardaActualiza(usuario) ;
			return true ;
		}
		else
			return false ;
	}
	
	public boolean eliminarUsuario(Short id_usuario) {
		if(daoUsuario.daoUsuarioById(id_usuario) != null) {
			Usuario usuario =	daoUsuario.daoUsuarioById(id_usuario);
			usuario.setActivo(Short.parseShort("0"));
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
