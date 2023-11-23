package br.com.perritoCaliente.DAO.sqlQueries;

public class Queries {

    //RECEITAS
    public static final String CRIA_RECEITA = "INSERT INTO RECEITAS (IDUSUARIO, TITULO, MODOPREPARO) VALUES (?, ?, ?)";
    public static final String LISTAR_RECEITAS = "SELECT r.*, u.usuario FROM RECEITAS r INNER JOIN USUARIOS u ON r.idUsuario = u.idUsuario";

    public static final String LISTAR_RECEITAS_POR_AVALIACAO = "SELECT RECEITAS.* FROM RECEITAS" +
            "INNER JOIN AVALIACOES ON RECEITAS.IDRECEITA = AVALIACOES.IDRECEITA" +
            " WHERE AVALIACAO >= 4 ORDER BY AVALIACAO DESC";

    public static final String LISTAR_RECEITAS_CATEGORIAS = "SELECT * FROM RECEITAS WHERE IDCATEGORIAS = ?";

    public static final String PESQUISAR_RECEITAS = "SELECT * FROM RECEITAS WHERE TITUTLO LIKE %?%"; //Não retorna pesquisas com erros de digitação e afins

    public static final String INSERIR_IMAGEM = "INSERT INTO IMAGENSRECEITAS (IDRECEITA, IMAGEM) VALUES (?, ?)";

    public static final String INSERIR_VIDEO = "INSERT INTO VIDEOS (IDRECEITA, URLVIDEO) VALUES (?, ?)";

    public static final String  LISTAR_IMAGEM = "SELECT * FROM IMAGENSRECEITAS WHERE IDRECEITA = ?";

    public static final String INSERIR_INGREDIENTE = "INSERT INTO INGREDIENTES (IDRECEITA, NOMEINGREDIENTE) VALUES (?, ?)";

    public static final String OBTER_RECEITAS_DO_USUARIO_POR_ID = 
    "SELECT r.idReceita, r.titulo, r.modoPreparo " +
    "FROM Receitas r " +
    "WHERE r.idUsuario = ?";

    public static final String OBTER_RECEITA_POR_ID = "SELECT * FROM Receitas WHERE IDRECEITA = ?";

    public static final String OBTER_INGREDIENTES_POR_RECEITA_ID = "SELECT * FROM Ingredientes WHERE IDRECEITA = ?";

    public static final String OBTER_URL_VIDEO_POR_RECEITA_ID = "SELECT urlVideo FROM Videos WHERE IDRECEITA = ?";

    //CATEGORIAS
    public static final String LISTAR_CATEGORIA = "SELECT * FROM CategoriasReceitas";

    // USUÁRIOS
    public static final String CRIA_USUARIO = "INSERT INTO USUARIOS (NOME, EMAIL, USUARIO, SENHA) VALUES (?, ?, ?, ?)";

    public static final String AUTENTICA_USUARIO = "SELECT * FROM USUARIOS WHERE USUARIO = ? AND SENHA = ?";

    public static final String LISTAR_USUARIOS = "SELECT * FROM Usuarios";

    public static final String CONSULTA_USUARIO_POR_ID = "SELECT * FROM USUARIOS WHERE idUsuario = ?";

    public static final String DELETAR_USUARIO = "DELETE Usuario WHERE idUsuario = ?";

    public static final String DELETAR_RECEITA = "DELETE Receitas WHERE idReceita = ?";

    public static final String DELETAR_INGREDIENTES_POR_RECEITA = "DELETE FROM RECEITAS WHERE IDRECEITA = ?";
    
    public static final String ATUALIZAR_RECEITA = "UPDATE Receitas SET titulo = ?, modoPreparo = ? WHERE idReceita = ?";
}
