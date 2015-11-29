package beans;

import java.io.Serializable;

public class Proveedor implements Serializable{

	private static final long serialVersionUID = 5544768418483223027L;
	
	private Long cuilProveedor;
	private String razonSocial;
	private String direccion;
	private String telefono;
	private boolean estado;

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
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

	/**
	 * @return the cUILProveedor
	 */
	public Long getCuilProveedor() {
		return cuilProveedor;
	}

	/**
	 * @param cUILProveedor the cUILProveedor to set
	 */
	public void setCuilProveedor(Long cUILProveedor) {
		cuilProveedor = cUILProveedor;
	}

}
