package entities;

import entities.*;
import java.util.HashMap;

public class Integrante {

	private int idIntegrante;
	private String nombre, apellido, steamHex, discordId, usuario, pw;
	private Rol rol;
	private Rango rango;
	private Hora hora;
	private Ran_Subdivision ranSub;
	private Sancion sancion;
	private Medalla medalla;
	public Sancion getSancion() {
		return sancion;
	}
	public void setSancion(Sancion sancion) {
		this.sancion = sancion;
	}
	public Medalla getMedalla() {
		return medalla;
	}
	public void setMedalla(Medalla medalla) {
		this.medalla = medalla;
	}


	public Hora getHora() {
		return hora;
	}
	public void setHora(Hora hora) {
		this.hora = hora;
	}
	public void setRanSub(Ran_Subdivision ranSub) {
		this.ranSub = ranSub;
	}
	public Ran_Subdivision getRanSub() {
		return ranSub;
	}

	public int getIdIntegrante() {
		return idIntegrante;
	}

	public void setIdIntegrante(int idIntegrante) {
		this.idIntegrante = idIntegrante;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getSteamHex() {
		return steamHex;
	}

	public void setSteamHex(String steamHex) {
		this.steamHex = steamHex;
	}

	public String getDiscordId() {
		return discordId;
	}

	public void setDiscordId(String discordId) {
		this.discordId = discordId;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public Integrante() 
	{
		this.roles=new HashMap<>();
	}
	
	// ROL

	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	
	
	//RANGO
	
	public Rango getRango() {
		return rango;
	}
	public void setRango(Rango rango) {
		this.rango = rango;
	}
}
