package entities;

public class Ran_Subdivision {

	private String nombreRangoSub;
	private int idSub, idRanSub;
	private Ransub_integrante rsi;
	
	public Ransub_integrante getRsi() {
		return rsi;
	}
	public void setRsi(Ransub_integrante rsi) {
		this.rsi = rsi;
	}
	public int getIdRanSub() {
		return idRanSub;
	}
	public void setIdRanSub(int idRanSub) {
		this.idRanSub = idRanSub;
	}
	public String getNombreRangoSub() {
		return nombreRangoSub;
	}
	public void setNombreRangoSub(String nombreRangoSub) {
		this.nombreRangoSub = nombreRangoSub;
	}
	public int getIdSub() {
		return idSub;
	}
	public void setIdSub(int idSub) {
		this.idSub = idSub;
	}
}
