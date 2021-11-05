package entities;

import java.util.LinkedList;



public class Integrante {

	private int idIntegrante;
	private String nombre, apellido, steamHex, discordId, usuario, pw;
	private Rol rol;
	private Ran_Integrante ranInt;
	private LinkedList<Hora> hora;
	private Subdivision sub;
	private LinkedList<Sancion> sancion;
	private LinkedList<Medalla> medalla;
	
	
	public LinkedList<Medalla> getMedalla() {
		return medalla;
	}
	public void setMedalla(LinkedList<Medalla> medalla) {
		this.medalla = medalla;
	}
	
	public Subdivision getSub() 
	{
		return sub;
	}
	public void setSub(Subdivision sub) {
		this.sub = sub;
	}
	public LinkedList<Sancion> getSancion() {
		return sancion;
	}
	public void setSancion(LinkedList<Sancion> sancion) {
		this.sancion = sancion;
	}
	public LinkedList<Hora> getHora() {
		return hora;
	}
	public void setHora(LinkedList<Hora> hora) {
		this.hora = hora;
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
		
	}
	
	// ROL

	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	//RANGO-Fecha
	public Ran_Integrante getRanInt() {
		return ranInt;
	}
	public void setRanInt(Ran_Integrante ranInt) {
		this.ranInt = ranInt;
	}

}
