package entities;
import java.time.*;

public class Hora 
{
	private int idIntegrante;
	private LocalTime horaInicio, horaFin, horasJugadas;
	private LocalDate fechaInicio, fechaFin;
	
	public LocalDate getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
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
	public LocalTime getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(LocalTime horaInicio) {
		this.horaInicio = horaInicio;
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
}
