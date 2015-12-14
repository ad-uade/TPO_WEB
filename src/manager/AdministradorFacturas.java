package manager;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.RemitoExteriorVO;
import com.group7.remote.InterfazRemotaODV;


public class AdministradorFacturas
{	
	private InterfazRemotaODV oficinaVentas;
	private static AdministradorFacturas instancia;
	
	public static AdministradorFacturas getInstancia()
	{
		if(instancia==null)
			instancia = new AdministradorFacturas();
		return instancia;
	}
	
	private AdministradorFacturas()
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

//	public void generarFactura(RemitoExteriorVO r) {
//		try{
//			oficinaVentas.generarFactura(r);
//		}catch (RemoteException e){
//			e.printStackTrace();
//		}
//		
//	}
//	
//	public void efectuarConformidad(Integer nro){
//		try {
//			oficinaVentas.registrarConformidadCliente(nro);
//		} catch (RemoteException e) {
//			e.printStackTrace();
//		}
//	}
    
}
