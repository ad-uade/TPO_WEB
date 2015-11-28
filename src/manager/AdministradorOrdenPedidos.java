package manager;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.CotizacionVO;
import com.group7.remote.InterfazRemotaODV;


public class AdministradorOrdenPedidos
{	
	private InterfazRemotaODV oficinaVentas;
	private static AdministradorOrdenPedidos instancia;
	
	public static AdministradorOrdenPedidos getInstancia()
	{
		if(instancia==null)
			instancia = new AdministradorOrdenPedidos();
		return instancia;
	}
	
	private AdministradorOrdenPedidos()
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
	
	public List<CotizacionVO> getCotizaciones() {
		try{
			return oficinaVentas.dameCotizaciones();
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}

	public CotizacionVO getCotizacion(Integer nro) {
		try{
			return oficinaVentas.dameCotizacion(nro);
		}catch (RemoteException e){
			e.printStackTrace();
		}
		return null;
	}

	public void generarOrdenDePedido(CotizacionVO c) {
		try{
			oficinaVentas.generarOrdenPedido(c);
		}catch (RemoteException e){
			e.printStackTrace();
		}
		
	}
	
   
    
}
