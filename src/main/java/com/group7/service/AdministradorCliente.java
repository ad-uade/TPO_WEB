package com.group7.service;

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
			oficinaVentas = (InterfazRemotaODV) Naming.lookup("TPO_Rodamientos");
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

	public ClienteVO getCliente(Integer cuil) {
		try {
			return oficinaVentas.traerCliente(cuil);
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

	public boolean alta(Integer cuil, String razonSocial, String direccion, String telefono, OficinaVentasVO of) {
		try {
			return oficinaVentas.altaCliente(razonSocial, cuil, direccion, telefono, of);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return false;
	}

	public void baja(ClienteVO c) {
		try {
			oficinaVentas.bajaCliente(c.getCUILCliente());
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
