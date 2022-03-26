package entities;

import java.time.LocalDate;

public class Ran_Integrante {
	private LocalDate fecha_desde;
	private Rango rango;
	private Integrante inte;
	
	public Ran_Integrante() {
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
	public Integrante getInte() {
		return inte;
	}
	public void setInte(Integrante inte) {
		this.inte = inte;
	}
}
