package entities;
import java.time.*;

public class Hora 
{
	private int idIntegrante;
	private LocalTime horaFin, horasJugadas;
	private LocalDate fechaFin;
	private LocalDateTime inicio, fin;
	
	public LocalDate getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(LocalDate fechaFin) {
		this.fechaFin = fechaFin;
	}
	public Hora () {
	}
	public int getIdIntegrante() {
		return idIntegrante;
	}
	public void setIdIntegrante(int idIntegrante) {
		this.idIntegrante = idIntegrante;
	}
	public LocalTime getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(LocalTime horaFin) {
		this.horaFin = horaFin;
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
