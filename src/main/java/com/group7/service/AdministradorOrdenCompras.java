package com.group7.service;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import com.group7.business.OrdenCompraVO;
import com.group7.business.OrdenPedidoVO;
import com.group7.business.RodamientoVO;
import com.group7.remote.InterfazRemotaCPR;

public class AdministradorOrdenCompras {
	
	private InterfazRemotaCPR cpr;
	private static AdministradorOrdenCompras instancia;

	public static AdministradorOrdenCompras getInstancia() {
		if (instancia == null)
			instancia = new AdministradorOrdenCompras();
		return instancia;
	}

	private AdministradorOrdenCompras() {
		try {
			cpr = (InterfazRemotaCPR) Naming.lookup("TPO_Rodamientos2");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}

	public List<OrdenPedidoVO> getOrdenesPedidos() {
		try {
			return cpr.listarOrdenesPedido();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public OrdenPedidoVO getOrdenPedido(Integer nro) {
		try {
			return cpr.dameOrdenVO(nro);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void generarOrdenDeCompra(OrdenPedidoVO op) {
		try {
			cpr.generarOrdenDeCompra(op);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public void generarOCManual(List<RodamientoVO> items, List<Integer> cantidades) {
		try {
			cpr.generarOrdenDeCompraManual(items, cantidades);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public void recepcionDeMercaderia(OrdenCompraVO oc) {
		try {
			cpr.recepcionDeMercaderia(oc);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public OrdenCompraVO traerOC(Integer nro) {
		try {
			return cpr.dameOrdenCompraVO(nro);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<OrdenCompraVO> getOrdenesCompras() {
		try {
			return cpr.dameOrdenesComprasVO();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
}
