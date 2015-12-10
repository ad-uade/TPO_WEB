package manager;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.OrdenPedidoVO;
import com.group7.remote.InterfazRemotaCPR;;


public class AdministradorRemitos
{	
	private InterfazRemotaCPR cpr;
	private static AdministradorRemitos instancia;
	
	public static AdministradorRemitos getInstancia()
	{
		if(instancia==null)
			instancia = new AdministradorRemitos();
		return instancia;
	}
	
	private AdministradorRemitos()
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

	public List<OrdenPedidoVO> getOrdenesPedidos() {
		try{
			return cpr.listarOrdenesPedidoARemitir();
		}catch(RemoteException e){
			e.printStackTrace();
		}
		return null;
	}

	public OrdenPedidoVO getOrdenPedido(Integer nro) {
		try{
			return cpr.dameOrdenVO(nro);
		}catch(RemoteException e){
			e.printStackTrace();
		}
		return null;
	}

	public void generarRemito(OrdenPedidoVO op) {
		try{
			cpr.revisarOrdenDePedido(op);
		}catch(RemoteException e){
			e.printStackTrace();
		}
	}
}
