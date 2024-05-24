package model;

import java.sql.Date;

public class OperaBean 
{
	private int id;
	private String nome;
	private String descrizione;
	private String stile;
	private double prezzo;
	private Date dataCreazione;
	private String artista;
	private String immagine;
	
	public OperaBean(int id, String nome,  double prezzo, String stile, String artista, Date dataCreazione, String immagine, String descrizione) {
		super();
		this.id = id;
		this.nome = nome;
		this.descrizione = descrizione;
		this.stile = stile;
		this.prezzo = prezzo;
		this.dataCreazione = dataCreazione;
		this.artista = artista;
		this.immagine = immagine;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getStile() {
		return stile;
	}

	public void setStile(String stile) {
		this.stile = stile;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public Date getDataCreazione() {
		return dataCreazione;
	}

	public void setDataCreazione(Date dataCreazione) {
		this.dataCreazione = dataCreazione;
	}

	public String getArtista() {
		return artista;
	}

	public void setArtista(String artista) {
		this.artista = artista;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
	
	
}
