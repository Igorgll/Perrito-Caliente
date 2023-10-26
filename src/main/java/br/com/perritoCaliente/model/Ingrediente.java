package br.com.perritoCaliente.model;

public class Ingrediente {


    private int idIngrediente;
    private String nomeIngrediente;
    private double qtdIngrediente;
    private String unidadeReceita;


    public Ingrediente(int idIngrediente, String nomeIngrediente) {
        this.idIngrediente = idIngrediente;
        this.nomeIngrediente = nomeIngrediente;
    }


    public Ingrediente() {

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

    public double getQtdIngrediente() {
        return qtdIngrediente;
    }

    public void setQtdIngrediente(double qtdIngrediente) {
        this.qtdIngrediente = qtdIngrediente;
    }

    public String getUnidadeReceita() {
        return unidadeReceita;
    }

    public void setUnidadeReceita(String unidadeReceita) {
        this.unidadeReceita = unidadeReceita;
    }
}
