package entities;

import java.time.*;
import java.util.LinkedList;

public class Robo {
	
	private int nroRobo;
	private String resultado;
	private LocalTime hora_robo;
	private LocalDate fecha_robo;
	
	private LinkedList<Integrante> integrantes;
	private LugarRobo lugar_robo;
	
	public int getNroRobo() {
		return nroRobo;
	}
	public void setNroRobo(int nroRobo) {
		this.nroRobo = nroRobo;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	public LocalTime getHora_robo() {
		return hora_robo;
	}
	public void setHora_robo(LocalTime hora_robo) {
		this.hora_robo = hora_robo;
	}
	public LocalDate getFecha_robo() {
		return fecha_robo;
	}
	public void setFecha_robo(LocalDate fecha_robo) {
		this.fecha_robo = fecha_robo;
	}
	public LinkedList<Integrante> getIntegrantes() {
		return integrantes;
	}
	public void setIntegrantes(LinkedList<Integrante> integrantes) {
		this.integrantes = integrantes;
	}
	public LugarRobo getLugar_robo() {
		return lugar_robo;
	}
	public void setLugar_robo(LugarRobo lugar_robo) {
		this.lugar_robo = lugar_robo;
	}
}
