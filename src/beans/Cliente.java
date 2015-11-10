package beans;

import java.io.Serializable;
 
public class Cliente implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5499238085104522599L;
	private int CUILCliente;
	private String razonSocial;
	private String direccion;
	private String telefono;
	private String oficinaDeVentas;
	private boolean estado;
	
	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public int getCUILCliente() {
		return CUILCliente;
	}

	public void setCUILCliente(int cUILCliente) {
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
		oficinaDeVentas = oDV;
	}

	public String getODV() {
		return oficinaDeVentas;
	}
	
	
}
