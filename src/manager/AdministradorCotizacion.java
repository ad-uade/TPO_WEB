package manager;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.CondicionVentaVO;
import com.group7.business.CotizacionVO;
import com.group7.business.RodamientoVO;
import com.group7.business.SolicitudCotizacionVO;
import com.group7.remote.InterfazRemotaODV;

public class AdministradorCotizacion
{	
	private InterfazRemotaODV oficinaVentas;
	private static AdministradorCotizacion instancia;
	
	public static AdministradorCotizacion getInstancia()
	{
		if(instancia==null)
			instancia = new AdministradorCotizacion();
		return instancia;
	}
	
	private AdministradorCotizacion()
	{
		try {
			oficinaVentas = (InterfazRemotaODV) Naming.lookup("AdministracionODV");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}
	
	public  void guardarSolicitudCotizacion(SolicitudCotizacionVO solicitudCotizacionVO) {
		try {
			oficinaVentas.guardarSolicitudCotizacion(solicitudCotizacionVO);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public void generarSolicitud(SolicitudCotizacionVO sc, Integer diasValidez) {
		try {
			oficinaVentas.generarCotizacion(sc, diasValidez);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public  RodamientoVO getRodamiento(String SFK, String codigo) {
		try {
			return oficinaVentas.obtenerRodamiento(SFK,codigo);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<RodamientoVO> getRodamientos() {
		try {
			return oficinaVentas.traerRodamientos();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<SolicitudCotizacionVO> getSolicitudesCotizacion() {
		try {
			return oficinaVentas.listarSolicitudesCotizacion();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public SolicitudCotizacionVO getSolicitudCotizacion(Integer nro) {
		try {
			return oficinaVentas.dameSolicitud(nro);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public CotizacionVO getCotizacion(Integer nro) {
		try {
			return oficinaVentas.dameCotizacion(nro);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void aprobarCotizacion (CotizacionVO cotizacion){
		
		try {
			oficinaVentas.aprobarCotizacion(cotizacion);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<CondicionVentaVO> getCondiciones() {
		try {
			return oficinaVentas.buscarCondiciones();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public CondicionVentaVO getCondicion(Integer nro){
		try{
			return oficinaVentas.dameCondicion(nro);
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}
	
	

	
   
    
}
