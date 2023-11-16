package br.com.perritoCaliente.model;

import java.util.ArrayList;

public class Receita {
    private int idReceita;
    private String nomeReceita;
    private String modoPreparo;

    public Receita(String nomeReceita, String modoPreparo) {
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
    }

    public Receita(int idReceita, String nomeReceita, String modoPreparo) {
        this.idReceita = idReceita;
        this.nomeReceita = nomeReceita;
        this.modoPreparo = modoPreparo;
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

}