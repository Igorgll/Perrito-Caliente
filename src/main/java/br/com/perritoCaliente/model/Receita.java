package br.com.perritoCaliente.model;

import java.util.ArrayList;
import java.util.List;

public class Receita {
    private int idReceita;
    private String nomeReceita;
    private String modoPreparo;
    private int idUsuario;
    private Usuario usuario;
    private List<Ingrediente> ingredientes = new ArrayList<>();
    private String urlVideo;

    public Receita(){}

    public Receita(String nomeReceita, String modoPreparo) {
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
    }

    public Receita(int idReceita, String nomeReceita, String modoPreparo) {
        this.idReceita = idReceita;
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
    }

    public Receita(String nomeReceita, String modoPreparo, Usuario usuario) {
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
        this.usuario = usuario;
    }

    public Receita(int idReceita, String nomeReceita, String modoPreparo, Usuario usuario) {
        this.idReceita = idReceita;
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
        this.usuario = usuario;
    }

    public Receita(int idReceita, String nomeReceita, String modoPreparo, Usuario usuario,
            List<Ingrediente> ingredientes, String urlVideo) {
        this.idReceita = idReceita;
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
        this.usuario = usuario;
        this.ingredientes = ingredientes;
        this.urlVideo = urlVideo;
    }

    public String getModoPreparo() {
        return modoPreparo;
    }

    public void setModoPreparo(String modoPreparo) {
        this.modoPreparo = modoPreparo;
    }

    public int getIdReceita() {
        return idReceita;
    }

    public void setIdReceita(int idReceita) {
        this.idReceita = idReceita;
    }

    public String getNomeReceita() {
        return nomeReceita;
    }

    public void setNomeReceita(String nomeReceita) {
        this.nomeReceita = nomeReceita;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Ingrediente> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(List<Ingrediente> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }
    
}
