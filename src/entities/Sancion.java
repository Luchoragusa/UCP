package entities;

public class Sancion {

	private Integrante integrante;
	private String motivo, tipoSancion;
	
	public Sancion() {
		
	}

	public Integrante getIntegrante() {
		return integrante;
	}

	public void setIdIntegrante(Integrante inte) {
		this.integrante = inte;
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
