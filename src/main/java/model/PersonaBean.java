package model;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PersonaBean {
	
	private String nome;
	private String cognome;
	private String cf;
	private String indirizzo;
	private String email;
	private String password;
	private String role;
	
	public PersonaBean(String cf, String nome, String cognome, String indirizzo, String email, String password) {
		this.nome = nome;
		this.cognome = cognome;
		this.cf = cf;
		this.indirizzo = indirizzo;
		this.email = email;
		setPassword(password); //per crittografare la password
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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
		try
        {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes(StandardCharsets.UTF_8));
            this.password = String.format("%040x", new BigInteger(1, digest.digest()));
        }
        catch (NoSuchAlgorithmException e)
        {
            throw new RuntimeException(e);
        }
	}
}
