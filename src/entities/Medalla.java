package entities;

public class Medalla {

	private int idMedalla;
	private String nomMedalla, tipoMedalla;
	
	public Medalla() {
	}
	public int getIdMedalla() {
		return idMedalla;
	}
	public void setIdMedalla(int idMedalla) {
		this.idMedalla = idMedalla;
	}
	public String getNomMedalla() {
		return nomMedalla;
	}
	public void setNomMedalla(String nomMedalla) {
		this.nomMedalla = nomMedalla;
	}
	public String getTipoMedalla() {
		return tipoMedalla;
	}
	public void setTipoMedalla(String tipoMedalla) {
		this.tipoMedalla = tipoMedalla;
	}
}
