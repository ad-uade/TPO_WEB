package beans;

import java.io.Serializable;


 
public class Cliente implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int CUILCliente;
	private String razonSocial;
	private String direccion;
	private String telefono;
	private String ODV;//Lo pongo como String para no agregar todas.
	private boolean estado;
	
	
	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public int getCuilCliente() {
		return CUILCliente;
	}

	public void setCuilCliente(int cUILCliente) {
		CUILCliente = cUILCliente;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public void setODV(String oDV) {
		ODV = oDV;
	}

	public String getODV() {
		return ODV;
	}
	
	
}
