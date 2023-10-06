package br.com.perritoCaliente.model;

public class Usuario {

    private String nome;
    private String usuario;
    private String email;
    private String senhaUsuario;

    public Usuario(String nome, String usuario, String email, String senhaUsuario) {
        this.nome = nome;
        this.usuario = usuario;
        this.email = email;
        this.senhaUsuario = senhaUsuario;
    }

    public Usuario() {
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenhaUsuario() {
        return senhaUsuario;
    }

    public void setSenhaUsuario(String senhaUsuario) {
        this.senhaUsuario = senhaUsuario;
    }
}
