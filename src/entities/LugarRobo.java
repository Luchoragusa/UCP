package entities;

public class LugarRobo {

	private int idLugarRobo, minIntregantes, maxIntegrantes;
	private String tipoRobo, lugarRobo;
	
	public int getMinIntregantes() {
		return minIntregantes;
	}

	public void setMinIntregantes(int minIntregantes) {
		this.minIntregantes = minIntregantes;
	}

	public int getMaxIntegrantes() {
		return maxIntegrantes;
	}

	public void setMaxIntegrantes(int maxIntegrantes) {
		this.maxIntegrantes = maxIntegrantes;
	}

	
	
	public LugarRobo() {
		
	}

	public int getIdLugarRobo() {
		return idLugarRobo;
	}

	public void setIdLugarRobo(int idLugarRobo) {
		this.idLugarRobo = idLugarRobo;
	}

	public String getTipoRobo() {
		return tipoRobo;
	}

	public void setTipoRobo(String tipoRobo) {
		this.tipoRobo = tipoRobo;
	}

	public String getLugarRobo() {
		return lugarRobo;
	}

	public void setLugarRobo(String lugarRobo) {
		this.lugarRobo = lugarRobo;
	}

}
