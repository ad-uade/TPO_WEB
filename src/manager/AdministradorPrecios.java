package manager;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.ListaPreciosVO;
import com.group7.business.ProveedorVO;
import com.group7.business.RodamientoVO;
import com.group7.remote.InterfazRemotaCPR;

public class AdministradorPrecios
{	
	private InterfazRemotaCPR cpr;
	private static AdministradorPrecios instancia;
	
	public static AdministradorPrecios getInstancia()
	{
		if(instancia==null)
			instancia = new AdministradorPrecios();
		return instancia;
	}
	
	private AdministradorPrecios()
	{
		try {
			cpr = (InterfazRemotaCPR) Naming.lookup("AdministracionCPR");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}
	
	public  List<ProveedorVO> getProveedores() {
		try {
			return cpr.listarProveedores();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public  ProveedorVO getProveedor(Integer cuil) {
		try {
			return cpr.traerProveedor(cuil);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public  void armarListaDePrecios(ProveedorVO proveedor, List<RodamientoVO> rodamientos, List<Float> precios, String tipo, String vigencia, float descuento) {
		try {
			cpr.armarListaDePrecios(proveedor, rodamientos, precios, tipo, vigencia, descuento);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public void actualizarComparativaPrecios(ListaPreciosVO lista){
		try {
			cpr.actualizarComparativaPrecios(lista);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public  List<ListaPreciosVO> getListasDePrecios() {
		try {
			return cpr.traerListas();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public  ListaPreciosVO getListaDePrecio(Integer nro) {
		try {
			return cpr.obtenerLista(nro);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
   
    
}
