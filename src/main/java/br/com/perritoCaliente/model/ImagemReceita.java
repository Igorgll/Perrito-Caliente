package br.com.perritoCaliente.model;
import java.io.File;
public class ImagemReceita {
    private String imagem;
    private String nomeImagem;
    private int idImagem;

    public ImagemReceita(String imagem, String nomeImagem) {
        this.imagem = imagem;
        this.nomeImagem = nomeImagem;
    }

    public ImagemReceita(String imagem) {
        this.imagem = imagem;
    }

    public ImagemReceita(String imagem, String nomeImagem, int idImagem) {
        this.imagem = imagem;
        this.nomeImagem = nomeImagem;
        this.idImagem = idImagem;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getNomeImagem() {
        return nomeImagem;
    }

    public void setNomeImagem(String nomeImagem) {
        this.nomeImagem = nomeImagem;
    }

    public int getIdImagem() {
        return idImagem;
    }

    public void setIdImagem(int idImagem) {
        this.idImagem = idImagem;
    }
}