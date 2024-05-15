package model;

public class PersonaBean {
	
	private String nome;
	private String cognome;
	private String cf;
	private String indirizzo;
	private String email;
	private String password;
	
	public PersonaBean(String cf, String nome, String cognome, String indirizzo, String email, String password) {
		this.nome = nome;
		this.cognome = cognome;
		this.cf = cf;
		this.indirizzo = indirizzo;
		this.email = email;
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getCf() {
		return cf;
	}

	public void setCf(String cf) {
		this.cf = cf;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
