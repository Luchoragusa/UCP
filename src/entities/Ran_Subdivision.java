package entities;

public class Ran_Subdivision {

	private String nombreRangoSub;
	private int idSub, idRanSub;
	private Subdivision sub;
	
	public int getIdRanSub() {
		return idRanSub;
	}
	public Subdivision getSub() {
		return sub;
	}
	public void setSub(Subdivision sub) {
		this.sub = sub;
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
