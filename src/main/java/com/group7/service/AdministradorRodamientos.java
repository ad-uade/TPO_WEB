package com.group7.service;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import com.group7.remote.InterfazRemotaCPR;

public class AdministradorRodamientos {
	
	private InterfazRemotaCPR cpr;
	private static AdministradorRodamientos instancia;

	public static AdministradorRodamientos getInstancia() {
		if (instancia == null)
			instancia = new AdministradorRodamientos();
		return instancia;
	}

	private AdministradorRodamientos() {
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

	public void alta(String codigoSFK, String codigoPieza, String descripcion, String paisOrigen, String marca,
			boolean estado) {
		try {
			cpr.altaRodamiento(codigoSFK, codigoPieza, descripcion, paisOrigen, marca, estado);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

}
