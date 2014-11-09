package dominio;
import java.math.*;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;
@Entity
@Table(name = "tiposdescuentos")
@NamedQueries({
	@NamedQuery(name = "daTipoDescuentoPorId", query = "from TiposDescuentos as tiposdescuentos where tiposdescuentos.id_tiposdescuentos=:id_TiposDescuentos"),
	@NamedQuery(name = "buscarTodos", query = "from TiposDescuentos as tiposdescuentos"),
	
})
public class TiposDescuentos {
	 @Id
	 @Column(name="id_tiposdescuentos",unique=true, nullable=false)
	private String id_tiposdescuentos; //Atributo identidad. Contendra el id unico (clave primaria)
	 @Column(name="fecha_ingreso", nullable=true)
	 private Date fecha_ingreso;
	 @Column(name="porcentaje_descuento", nullable=true)
	private BigDecimal porcentaje_descuento;
	 @Column(name="descripcion",nullable=true)
	 private String descripcion;
	 
	 public TiposDescuentos(){};
	 
	 
	 public String getIdTiposDescuentos(){
		 return id_tiposdescuentos;
	 }
	 public void setIdTiposDescuentos(String id){
		 this.id_tiposdescuentos=id;
	 }
	 
	public Date getFechaIngreso(){
		return fecha_ingreso;
	}
	public void setFechaIngreso(Date fecha){
		this.fecha_ingreso=fecha;
	}
	
	public BigDecimal getPorcentajeDescuento(){
		return porcentaje_descuento;
	}
	public void setPorcentajeDescuento(BigDecimal PD){
		this.porcentaje_descuento=PD;
	}
	public String getDescripcion(){
		return descripcion;
	}
	public void serDescripcion(String d){
		this.descripcion=d;
	}
	
	
}
