package beans;

import java.io.Serializable;

public class Rodamiento implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 888416142894898028L;
	private String codigoSFK;
	private String codigoPieza;
	private String descripcion;
	private String marca;
	private String paisOrigen;
	private boolean estado;
	
	public Rodamiento(){
		
	}

	public String getCodigoSFK() {
		return codigoSFK;
	}

	public void setCodigoSFK(String codigoSFK) {
		this.codigoSFK = codigoSFK;
	}

	public String getCodigoPieza() {
		return codigoPieza;
	}

	public void setCodigoPieza(String codigoPieza) {
		this.codigoPieza = codigoPieza;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getPaisOrigen() {
		return paisOrigen;
	}

	public void setPaisOrigen(String paisOrigen) {
		this.paisOrigen = paisOrigen;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
}
