package entities;

public class Arma 
{
	private int idArma;
	private String tipoArma, nombreArma;
	
	public Arma() {
	}
	public int getIdArma() {
		return idArma;
	}
	public void setIdArma(int idArma) {
		this.idArma = idArma;
	}
	public String getTipoArma() {
		return tipoArma;
	}
	public void setTipoArma(String tipoArma) {
		this.tipoArma = tipoArma;
	}
	public String getNombreArma() {
		return nombreArma;
	}
	public void setNombreArma(String nombreArma) {
		this.nombreArma = nombreArma;
	}
}
