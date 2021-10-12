package entities;
import java.time.*;

public class Hora 
{
	private int idIntegrante;
	private LocalTime horaInicio, horaFin, horasJugadas;
	private LocalDate fecha;
	
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
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public LocalTime getHorasJugadas() {
		return horasJugadas;
	}
	public void setHorasJugadas(LocalTime horasJugadas) {
		this.horasJugadas = horasJugadas;
	}
}
