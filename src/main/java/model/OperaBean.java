package model;

import java.sql.Date;
import java.util.Arrays;
import java.util.Objects;

public class OperaBean {
    private int id;
    private String nome;
    private String descrizione;
    private String stile;
    private double prezzo;
    private Date dataCreazione;
    private String artista;
    private byte[] immagine;

    public OperaBean(String nome, double prezzo, String stile, String artista, Date dataCreazione, byte[] immagine, String descrizione) {
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

    public byte[] getImmagine() {
        return immagine;
    }

    public void setImmagine(byte[] immagine) {
        this.immagine = immagine;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OperaBean opera = (OperaBean) o;
        return id == opera.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "OperaBean{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", stile='" + stile + '\'' +
                ", prezzo=" + prezzo +
                ", dataCreazione=" + dataCreazione +
                ", artista='" + artista + '\'' +
                ", immagine=" + Arrays.toString(immagine) +
                '}';
    }
}
