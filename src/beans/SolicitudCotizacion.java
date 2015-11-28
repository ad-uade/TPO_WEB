package beans;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class SolicitudCotizacion implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int nroSolicitudCotizacion;
	private Date fecha;
	private Cliente cliente;
	private List<ItemSolicitudCotizacion>items;
	
	public SolicitudCotizacion(){
		
	}

	public int getNroSolicitudCotizacion() {
		return nroSolicitudCotizacion;
	}

	public void setNroSolicitudCotizacion(int nroSolicitudCotizacion) {
		this.nroSolicitudCotizacion = nroSolicitudCotizacion;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<ItemSolicitudCotizacion> getItems() {
		return items;
	}

	public void setItems(List<ItemSolicitudCotizacion> items) {
		this.items = items;
	}
	
	
}
