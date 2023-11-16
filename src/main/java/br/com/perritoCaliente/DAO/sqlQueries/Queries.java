package br.com.perritoCaliente.DAO.sqlQueries;

public class Queries {

    //RECEITAS
    public static final String CRIA_RECEITA = "INSERT INTO Receitas (TITULO, MODOPREPARO) VALUES (?, ?)";
    public static final String LISTAR_RECEITAS = "SELECT * FROM Receitas";

    public static final String LISTAR_RECEITAS_POR_AVALIACAO = "SELECT RECEITAS.* FROM RECEITAS" +
            "INNER JOIN AVALIACOES ON RECEITAS.IDRECEITA = AVALIACOES.IDRECEITA" +
            " WHERE AVALIACAO >= 4 ORDER BY AVALIACAO DESC";

    public static final String LISTAR_RECEITAS_CATEGORIAS = "SELECT * FROM Receitas WHERE IDCATEGORIAS = ?";

    public static final String PESQUISAR_RECEITAS = "SELECT * FROM Receitas WHERE TITUTLO LIKE %?%"; //Não retorna pesquisas com erros de digitação e afins

    public static final String INSERIR_IMAGEM = "INSERT INTO IMAGENSRECEITAS (IDRECEITA, IMAGEM) VALUES (?, ?)";

    public static final String  LISTAR_IMAGEM = "SELECT * FROM IMAGENSRECEITAS WHERE IDRECEITA = ?";

    //CATEGORIAS
    public static final String LISTAR_CATEGORIA = "SELECT * FROM CategoriasReceitas";

    // USUÁRIOS
    public static final String CRIA_USUARIO = "INSERT INTO USUARIOS (NOME, EMAIL, USUARIO, SENHA) VALUES (?, ?, ?, ?)";

    public static final String AUTENTICA_USUARIO = "SELECT * FROM USUARIOS WHERE USUARIO = ? AND SENHA = ?";

    public static final String LISTAR_USUARIOS = "SELECT * FROM Usuarios";

    public static final String DELETAR_USUARIO = "DELETE Usuario WHERE idUsuario = ?";

    public static final String DELETAR_RECEITA = "DELETE Receitas WHERE idReceita = ?";
    public static final String ATUALIZAR_RECEITA = "UPDATE Receitas SET titulo = ?, modoPreparo = ? WHERE idReceita = ?";
}
