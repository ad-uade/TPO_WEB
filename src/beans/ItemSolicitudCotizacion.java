package beans;

import java.io.Serializable;

public class ItemSolicitudCotizacion implements Serializable{

	private static final long serialVersionUID = 6417151180302557481L;
	
	private int nroSolicitudCotizacion;
	private Rodamiento rodamiento;
	private int cantidad;
	
	public ItemSolicitudCotizacion(){
		
	}

	public Rodamiento getRodamiento() {
		return rodamiento;
	}

	public void setRodamiento(Rodamiento rodamiento) {
		this.rodamiento = rodamiento;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public int getNroSolicitudCotizacion() {
		return nroSolicitudCotizacion;
	}

	public void setNroSolicitudCotizacion(int nroSolicitudCotizacion) {
		this.nroSolicitudCotizacion = nroSolicitudCotizacion;
	}
	
	
}
