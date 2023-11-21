package br.com.perritoCaliente.DAO;

import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.model.Usuario;
import br.com.perritoCaliente.servlet.config.ConnectionPoolConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static br.com.perritoCaliente.DAO.sqlQueries.Queries.*;

public class usuariosDAO {
    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    public static void criarUsuario(Usuario usuario) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(CRIA_USUARIO)) {
                preparedStatement.setString(1, usuario.getNome());
                preparedStatement.setString(2, usuario.getUsuario());
                preparedStatement.setString(3, usuario.getEmail());
                preparedStatement.setString(4, usuario.getSenhaUsuario());
                int affectedRows = preparedStatement.executeUpdate();
                if (affectedRows > 0) {
                    System.out.println("Usuário criado com sucesso!");
                } else {
                    System.out.println("Falha ao adicionar o Usuário!");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int getUserID(PreparedStatement preparedStatement){
        int idUser=0;
        try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                idUser = generatedKeys.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idUser;
    }

    public static Usuario autenticaUsuario(String usuario, String senha) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(AUTENTICA_USUARIO)) {
                preparedStatement.setString(1, usuario);
                preparedStatement.setString(2, senha);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        System.out.println("Usuário autenticado: " + resultSet.getString("usuario"));
                        return new Usuario(resultSet.getString("nome"), resultSet.getString("email"), resultSet.getString("usuario"), resultSet.getString("senha"), resultSet.getInt("idUsuario"));
                        //adicionei um getInt para pegar o id do usuario autenticado
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // caso de invalidez no login
    }

    public List<Usuario> exibirTodosUsuarios() {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LISTAR_USUARIOS);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            System.out.println("Conexão bem-sucedida");

            List<Usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {
                String userName = resultSet.getString("nome");

                int userId = resultSet.getInt("idUsuario");


                Usuario usuario = new Usuario(userId, userName);
                usuarios.add(usuario);
            }

            System.out.println("Seleção de todas os usuarios bem-sucedida");

            return usuarios;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados");
            return Collections.emptyList();
        }

    }

    public void deletarUsuarioPorId(int idUsuario) {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETAR_USUARIO)) {

            preparedStatement.setInt(1, idUsuario);
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Usuário excluído com sucesso, ID: " + idUsuario);
            } else {
                System.out.println("Nenhuma Usuário foi excluída para o ID: " + idUsuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados");
        }
    }


    public static void atualizarUsuario(Usuario usuario) {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ATUALIZAR_RECEITA)) {

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setInt(2, usuario.getIdUsuario());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Usuario atualizado com sucesso, ID: " + usuario.getNome());
            } else {
                System.out.println("Nenhum Usuario foi atualizada para o ID: " + usuario.getIdUsuario());
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados");
            System.out.println("Erro: " + e.getMessage());
        }
    }


}


