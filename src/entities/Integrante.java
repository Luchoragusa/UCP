package entities;


public class Integrante {

	private int idIntegrante;
	private String nombre;
	private String apellido;
	private String steamHex;
	private String discordId;
	private String usuario;
	private String pw;
	
	public Integrante(int idIntegrante, String nombre, String apellido, String steamHex, String discordId) {
		super();
		this.idIntegrante = idIntegrante;
		this.nombre = nombre;
		this.apellido = apellido;
		this.steamHex = steamHex;
		this.discordId = discordId;
	}

	public Integrante(String nombre, String apellido, String discordId) 
	{
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.discordId = discordId;
	}
	
	public Integrante() {
	}
	
	public int getIdIntegrante() {
		return idIntegrante;
	}

	public void setIdIntegrante(int idIntegrante) {
		this.idIntegrante = idIntegrante;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getSteamHex() {
		return steamHex;
	}

	public void setSteamHex(String steamHex) {
		this.steamHex = steamHex;
	}

	public String getDiscordId() {
		return discordId;
	}

	public void setDiscordId(String discordId) {
		this.discordId = discordId;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
}