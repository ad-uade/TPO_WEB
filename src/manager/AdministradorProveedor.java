package manager;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.ProveedorVO;
import com.group7.remote.InterfazRemotaCPR;

public class AdministradorProveedor
{	
	private InterfazRemotaCPR cpr;
	private static AdministradorProveedor instancia;
	
	public static AdministradorProveedor getInstancia()
	{
		if(instancia==null)
			instancia = new AdministradorProveedor();
		return instancia;
	}
	
	private AdministradorProveedor()
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
	
	public  void actualizar(ProveedorVO p) {
		try {
			cpr.modificarProveedor(p);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public  boolean alta(Integer cuil, String razonSocial, String direccion, String telefono) {
		try {
			return cpr.altaProveedor(razonSocial, cuil, direccion, telefono);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}

	public  void baja(ProveedorVO c) {
		try {
			cpr.bajaProveedor(c.getCUILProveedor());
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
   
    
}
