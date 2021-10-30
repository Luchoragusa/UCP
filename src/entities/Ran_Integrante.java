package entities;

import java.time.LocalDate;

public class Ran_Integrante {
	private int idRango, idIntegrante;
	private LocalDate fecha_desde;
	private Rango rango;
	
	public Ran_Integrante() {
		
	}
	public int getIdRango() {
		return idRango;
	}
	public void setIdRango(int idRango) {
		this.idRango = idRango;
	}
	public int getIdIntegrante() {
		return idIntegrante;
	}

	public void setIdIntegrante(int idIntegrante) {
		this.idIntegrante = idIntegrante;
	}
	public LocalDate getFecha_desde() {
		return fecha_desde;
	}
	public Rango getRango() {
		return rango;
	}
	public void setRango(Rango rango) {
		this.rango = rango;
	}
	public void setFecha_desde(LocalDate fecha_desde) {
		this.fecha_desde = fecha_desde;
	}
}
