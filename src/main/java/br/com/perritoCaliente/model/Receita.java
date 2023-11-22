package br.com.perritoCaliente.model;

import java.util.ArrayList;

public class Receita {
    private int idReceita;
    private String nomeReceita;
    private String modoPreparo;
    private int idUsuario;
    private Usuario usuario;

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

}
