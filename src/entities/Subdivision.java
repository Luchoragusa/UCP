package entities;

public class Subdivision {

	private int idSub;
	private String descripcion, nomSubDivision;
	private Ran_Subdivision ranSub;
	
	public Subdivision() {		
	}
	public int getIdSub() {
		return idSub;
	}
	public void setIdSub(int idSub) {
		this.idSub = idSub;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNomSubDivision() {
		return nomSubDivision;
	}
	public void setNomSubDivision(String nomSubDivision) {
		this.nomSubDivision = nomSubDivision;
	}
	public Ran_Subdivision getRanSub() {
		return ranSub;
	}
	public void setRanSub(Ran_Subdivision ranSub) {
		this.ranSub = ranSub;
	}
	
}
