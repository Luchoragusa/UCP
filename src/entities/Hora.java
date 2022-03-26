package entities;
import java.time.*;

public class Hora 
{
	private int idIntegrante;
	private LocalTime horasJugadas;
	private LocalDateTime inicio, fin;
	
	public Hora () {
	}
	public int getIdIntegrante() {
		return idIntegrante;
	}
	public void setIdIntegrante(int idIntegrante) {
		this.idIntegrante = idIntegrante;
	}
	public LocalTime getHorasJugadas() {
		return horasJugadas;
	}
	public void setHorasJugadas(LocalTime horasJugadas) {
		this.horasJugadas = horasJugadas;
	}
	public LocalDateTime getInicio() {
		return inicio;
	}
	public void setInicio(LocalDateTime inicio) {
		this.inicio = inicio;
	}
	public LocalDateTime getFin() {
		return fin;
	}
	public void setFin(LocalDateTime fin) {
		this.fin = fin;
	}
}
