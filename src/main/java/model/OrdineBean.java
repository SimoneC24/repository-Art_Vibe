package model;

import java.sql.Date;

public class OrdineBean {
	
	private int id_ordine;
	private double totale;
	private Date data_ordine;
	private String numero_carta;
	private int cvv_carta;
	private Date data_scadenza_carta;
	private String id_utente;
	
	
	public OrdineBean(double totale, Date data_ordine, String numero_carta, int cvv_carta, Date data_scadenza_carta, String id_utente) {
		this.totale = totale;
		this.data_ordine = data_ordine;
		this.numero_carta = numero_carta;
		this.cvv_carta = cvv_carta;
		this.data_scadenza_carta = data_scadenza_carta;
		this.id_utente = id_utente;
	}
	

	public int getId_ordine() {
		return id_ordine;
	}
	public void setId_ordine(int id_ordine) {
		this.id_ordine = id_ordine;
	}
	public double getTotale() {
		return totale;
	}
	public void setTotale(double totale) {
		this.totale = totale;
	}
	public Date getData_ordine() {
		return data_ordine;
	}
	public void setData_ordine(Date data_ordine) {
		this.data_ordine = data_ordine;
	}
	public String getNumero_carta() {
		return numero_carta;
	}
	public void setNumero_carta(String numero_carta) {
		this.numero_carta = numero_carta;
	}
	public int getCvv_carta() {
		return cvv_carta;
	}
	public void setCvv_carta(int cvv_carta) {
		this.cvv_carta = cvv_carta;
	}
	public Date getData_scadenza_carta() {
		return data_scadenza_carta;
	}
	public void setData_scadenza_carta(Date data_scadenza_carta) {
		this.data_scadenza_carta = data_scadenza_carta;
	}
	public String getId_utente() {
		return id_utente;
	}
	public void setId_utente(String id_utente) {
		this.id_utente = id_utente;
	}
}
