package br.com.perritoCaliente.DAO.sqlQueries;

public class Queries {

    //public static final String CRIA_RECEITA = "INSERT INTO tb_receitas (Titulo, Ingredientes, Imagem, Tipo, Video) VALUES (?, ?, ?, ?, ?, ?)";
    public static final String CRIA_RECEITA = "INSERT INTO tb_receitas (nome_receita) VALUES (?)";
    public static final String LISTAR_RECEITAS = "SELECT * FROM tb_receitas";
    //public static final String
    public static final String DELETAR_RECEITA = "DELETE tb_receitas WHERE IDRECEITA = ?";
    public static final String ATUALIZAR_RECEITA = "UPDATE tb_receitas SET Titulo = ? WHERE idReceita = ?";

}
