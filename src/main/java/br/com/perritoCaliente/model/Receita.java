package br.com.perritoCaliente.model;

import java.util.ArrayList;

public class Receita {
    int idReceita;
    private String nomeReceita;
    private ArrayList<Ingrediente> ingredientes;
    private String imagemReceita;
    private String tipoReceita;
    private String videoReceita;

    public Receita(String nomeReceita) {
        this.nomeReceita = nomeReceita;
    }

    public Receita(String nomeReceita, int idReceita) {
        this.nomeReceita = nomeReceita;
        this.idReceita = idReceita;
    }


    public Receita(String nomeReceita, ArrayList<Ingrediente> ingredientes, String imagemReceita, String tipoReceita, String videoReceita) {
        this.nomeReceita = nomeReceita;
        this.ingredientes = ingredientes;
        this.imagemReceita = imagemReceita;
        this.tipoReceita = tipoReceita;
        this.videoReceita = videoReceita;
    }

    public Receita() {
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

    public ArrayList<Ingrediente> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(ArrayList<Ingrediente> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getImagemReceita() {
        return imagemReceita;
    }

    public void setImagemReceita(String imagemReceita) {
        this.imagemReceita = imagemReceita;
    }

    public String getTipoReceita() {
        return tipoReceita;
    }

    public void setTipoReceita(String tipoReceita) {
        this.tipoReceita = tipoReceita;
    }

    public String getVideoReceita() {
        return videoReceita;
    }

    public void setVideoReceita(String videoReceita) {
        this.videoReceita = videoReceita;
    }
}
