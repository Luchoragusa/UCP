package entities;

import java.time.LocalDate;

public class Sancion {

	private int idIntegrante, nroSancion, id;
	private String motivo, tipoSancion;
	private LocalDate fecha;
	
	public LocalDate getFecha() {
		return fecha;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	private boolean estado;
	public int getNroSancion() {
		return nroSancion;
	}
	public void setNroSancion(int nroSancion) {
		this.nroSancion = nroSancion;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public Sancion() {	
	}
	public int getIdIntegrante() {
		return idIntegrante;
	}
	public void setIdIntegrante(int idIntegrante) {
		this.idIntegrante = idIntegrante;
	}
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public String getTipoSancion() {
		return tipoSancion;
	}
	public void setTipoSancion(String tipoSancion) {
		this.tipoSancion = tipoSancion;
	}
}
