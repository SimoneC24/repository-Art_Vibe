package model;

import java.util.Base64;

public class OpereAcquistate {
	
	private int id;
	private int ordine_id;
	private String nome_opera;
	private double prezzo_opera;
	private byte[] immagine_opera;
	private int quantita_opera;
	private String immagineBase64;
	
	public OpereAcquistate(int ordine_id, String nome_opera, double prezzo_opera, byte[] immagine_opera, int quantita_opera) {
		this.ordine_id=ordine_id;
		this.nome_opera=nome_opera;
		this.prezzo_opera=prezzo_opera;
		this.immagine_opera=immagine_opera;
		this.quantita_opera=quantita_opera;
		
		if (immagine_opera != null && immagine_opera.length > 0) {
            this.immagineBase64 = Base64.getEncoder().encodeToString(immagine_opera);
        }
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrdine_id() {
		return ordine_id;
	}

	public void setOrdine_id(int ordine_id) {
		this.ordine_id = ordine_id;
	}

	public String getNome_opera() {
		return nome_opera;
	}

	public void setNome_opera(String nome_opera) {
		this.nome_opera = nome_opera;
	}

	public double getPrezzo_opera() {
		return prezzo_opera;
	}

	public void setPrezzo_opera(double prezzo_opera) {
		this.prezzo_opera = prezzo_opera;
	}

	public byte[] getImmagine_opera() {
		return immagine_opera;
	}

	public void setImmagine_opera(byte[] immagine_opera) {
		this.immagine_opera = immagine_opera;
	}

	public int getQuantita_opera() {
		return quantita_opera;
	}

	public void setQuantita_opera(int quantita_opera) {
		this.quantita_opera = quantita_opera;
	}
	
	public String getImmagineBase64() {
        return immagineBase64;
    }

    public void setImmagineBase64(String immagineBase64) {
        this.immagineBase64 = immagineBase64;
    }
}
