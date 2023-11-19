package br.com.perritoCaliente.model;

public class Ingrediente {


    private int idIngrediente;
    private String nomeIngrediente;

    public Ingrediente() {
    }

    public Ingrediente(int idIngrediente, String nomeIngrediente) {
        this.idIngrediente = idIngrediente;
        this.nomeIngrediente = nomeIngrediente;
    }

    public Ingrediente(String nomeIngrediente) {
        this.nomeIngrediente = nomeIngrediente;
    }

    public int getIdIngrediente() {
        return idIngrediente;
    }

    public void setIdIngrediente(int idIngrediente) {
        this.idIngrediente = idIngrediente;
    }

    public String getNomeIngrediente() {
        return nomeIngrediente;
    }

    public void setNomeIngrediente(String nomeIngrediente) {
        this.nomeIngrediente = nomeIngrediente;
    }
}
