package br.com.perritoCaliente.DAO.sqlQueries;

public class Queries {
    //public static final String CRIA_RECEITA = "INSERT INTO tb_receitas (Titulo, Ingredientes, Imagem, Tipo, Video) VALUES (?, ?, ?, ?, ?, ?)";
    public static final String CRIA_RECEITA = "INSERT INTO Receitas (titulo) VALUES (?)";
    public static final String LISTAR_RECEITAS = "SELECT * FROM Receitas";
    //public static final String
    public static final String DELETAR_RECEITA = "DELETE Receitas WHERE idReceita = ?";
    public static final String ATUALIZAR_RECEITA = "UPDATE Receitas SET titulo = ? WHERE idReceita = ?";
}
