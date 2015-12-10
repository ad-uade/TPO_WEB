package manager;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.ClienteVO;
import com.group7.business.OficinaVentasVO;
import com.group7.remote.InterfazRemotaODV;

public class AdministradorCliente {
	private InterfazRemotaODV oficinaVentas;
	private static AdministradorCliente instancia;

	public static AdministradorCliente getInstancia() {
		if (instancia == null)
			instancia = new AdministradorCliente();
		return instancia;
	}

	private AdministradorCliente() {
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

	public List<ClienteVO> getClientes() {
		try {
			return oficinaVentas.listarClientes();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ClienteVO getCliente(Long cuil) {
		try {
			return oficinaVentas.buscarCliente(cuil);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void actualizar(ClienteVO c) {
		try {
			oficinaVentas.modificarCliente(c);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public void alta(ClienteVO clientevo) {
		try {
			oficinaVentas.altaCliente(clientevo);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public void baja(ClienteVO c) {
		try {
			oficinaVentas.bajaCliente(c.getCuilCliente());
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public List<OficinaVentasVO> getOficinas() {
		try {
			return oficinaVentas.obtenerOficinas();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public OficinaVentasVO getOficina(Integer nro) {
		try {
			return oficinaVentas.dameOficina(nro);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

}
