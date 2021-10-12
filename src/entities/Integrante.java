package entities;

import entities.*;
import java.util.HashMap;

public class Integrante {

	private int idIntegrante;
	private String nombre, apellido, steamHex, discordId, usuario, pw;
	private HashMap<Integer, Rol> roles;
	private HashMap<Integer, Rango> rangos;
	private Rango ran;
	private Horas hor;
	private Ran_Subdivision ranSub;

	public int getIdIntegrante() {
		return idIntegrante;
	}

	public HashMap<Integer, Rol> getRoles() {
		return roles;
	}

	public void setRoles(HashMap<Integer, Rol> roles) {
		this.roles = roles;
	}

	public HashMap<Integer, Rango> getRangos() {
		return rangos;
	}

	public void setRangos(HashMap<Integer, Rango> rangos) {
		this.rangos = rangos;
	}

	public Rango getRan() {
		return ran;
	}

	public void setRan(Rango ran) {
		this.ran = ran;
	}

	public Horas getHor() {
		return hor;
	}

	public void setHor(Horas hor) {
		this.hor = hor;
	}

	public Ran_Subdivision getRanSub() {
		return ranSub;
	}

	public void setRanSub(Ran_Subdivision ranSub) {
		this.ranSub = ranSub;
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
	
	public void addRol(Rol rolToBeAdded) 
	{
		this.roles.put(rolToBeAdded.getIdRol(), rolToBeAdded);
	}
	
	public void removeRol(Rol rolToBeRemoved) 
	{
		this.roles.remove(rolToBeRemoved.getIdRol());
	}
	
	public boolean hasRol(Rol rolToCheck) 
	{
		return this.roles.containsKey(rolToCheck.getIdRol());
	}
	public void addRango(Rango rangoToBeAdded) {
		this.rangos.put(rangoToBeAdded.getIdRango(), rangoToBeAdded);
		
	}
	
	public void removeRango(Rango rangoToBeRemoved) 
	{
		this.rangos.remove(rangoToBeRemoved.getIdRango());
	}
	
	public boolean hasRango(Rango rangoToCheck) 
	{
		return this.rangos.containsKey(rangoToCheck.getIdRango());
	}
	
}
