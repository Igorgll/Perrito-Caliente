package br.com.perritoCaliente.DAO;

import br.com.perritoCaliente.model.ImagemReceita;
import br.com.perritoCaliente.model.Ingrediente;
import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.model.Usuario;
import br.com.perritoCaliente.model.VideoReceita;
import br.com.perritoCaliente.servlet.config.ConnectionPoolConfig;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static br.com.perritoCaliente.DAO.sqlQueries.Queries.*;

public class receitasDAO {
    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    public static void criarReceita(int idUsuario, Receita receita, ImagemReceita img, Ingrediente ingrediente, VideoReceita video){

        int idReceita = inserirReceita(receita, idUsuario);
        if(idReceita != 0 && idUsuario != 0) {
            inserirIngrediente(ingrediente, idReceita);
            inserirImagem(img, idReceita);
            inserirVideo(video, idReceita);
            System.out.println("Receita criada com sucesso!");
        }
        else {
            System.out.println("Falha ao criar receita");
        }
    }

    public static int inserirReceita(Receita receita, int idUsuario) {
        int idGerado = 0;
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CRIA_RECEITA, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setInt(1, idUsuario);
            preparedStatement.setString(2, receita.getNomeReceita());
            preparedStatement.setString(3, receita.getModoPreparo());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        idGerado = generatedKeys.getInt(1); // obtém o id gerado
                    }
                }
                System.out.println("Nome e modo de preparo adicionados com sucesso!");
            } else {
                System.out.println("Falha ao adicionar o nome e modo de preparo!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
        }
        return idGerado;
    }

    public static void inserirImagem(ImagemReceita img, int idReceita) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERIR_IMAGEM)) {
                if (idReceita != 0){
                    preparedStatement.setInt(1, idReceita);
                    preparedStatement.setString(2, img.getImagem());
                    int affectedRows = preparedStatement.executeUpdate();
                    if (affectedRows > 0) {
                        System.out.println("Imagem adicionada com sucesso a receita com id: " + idReceita);
                    } else {
                        System.out.println("Falha ao adicionar a imagem!");
                    }
                } else {
                    System.out.printf("falha ao adicionar imagem");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
        }
    }

    public static void inserirVideo(VideoReceita video, int idReceita) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERIR_VIDEO)) {
                if (idReceita != 0 && video != null){
                    preparedStatement.setInt(1, idReceita);
                    preparedStatement.setString(2, video.getVideo());
                    int affectedRows = preparedStatement.executeUpdate();
                    if (affectedRows > 0) {
                        System.out.println("Video adicionado com sucesso a receita com id: " + idReceita);
                    } else {
                        System.out.println("O video não foi adicionado, valor nulo para video ou idReceita = 0!");
                    }
                } else {
                    System.out.printf("falha ao adicionar video");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
        }
    }

    public static void inserirIngrediente(Ingrediente ingrediente, int idReceita) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERIR_INGREDIENTE)) {
                if (idReceita != 0){
                    preparedStatement.setInt(1, idReceita);
                    preparedStatement.setString(2, ingrediente.getNomeIngrediente());
                    int affectedRows = preparedStatement.executeUpdate();
                    if (affectedRows > 0) {
                        System.out.println("Ingrediente adicionado com sucesso à receita com id: " + idReceita);
                    } else {
                        System.out.println("Falha ao adicionar ingrediente!");
                    }
                } else {
                    System.out.printf("falha ao adicionar ingrediente");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
        }
    }

    public List<Receita> exibirTodasReceitas() {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LISTAR_RECEITAS);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            System.out.println("Conexão bem-sucedida");

            List<Receita> recipes = new ArrayList<>();

            while (resultSet.next()) {
                String recipeName = resultSet.getString("titulo");
                String recipePreparement = resultSet.getString("modoPreparo");
                String userName = resultSet.getString("usuario");

                Usuario usuario = new Usuario(userName);
                Receita receita = new Receita(recipeName, recipePreparement, usuario);
                recipes.add(receita);
            }

            System.out.println("Seleção de todas as receitas bem-sucedida");

            return recipes;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados");
            return Collections.emptyList();
        }
    }

    //Precisa de alterações
    public List<ImagemReceita> exibirImagem() {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LISTAR_IMAGEM);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            System.out.println("Conexão bem-sucedida");

            List<ImagemReceita> imgArray = new ArrayList<>();

            while (resultSet.next()) {
                //int imgID = resultSet.getInt("idImagem");
                String imgFile = resultSet.getString("imagem");

                ImagemReceita img = new ImagemReceita(imgFile);
                imgArray.add(img);
            }

            System.out.println("Seleção de todas as receitas bem-sucedida");

            return imgArray;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public void deletarReceitaPorId(int idReceita) {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETAR_RECEITA)) {

            preparedStatement.setInt(1, idReceita);
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Receita excluída com sucesso, ID: " + idReceita);
            } else {
                System.out.println("Nenhuma receita foi excluída para o ID: " + idReceita);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados");
        }
    }

    public static void atualizarReceita(Receita receita) {
        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ATUALIZAR_RECEITA)) {

            preparedStatement.setString(1, receita.getNomeReceita());
            preparedStatement.setString(2, receita.getModoPreparo());
            preparedStatement.setInt(3, receita.getIdReceita());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Receita atualizada com sucesso, ID: " + receita.getIdReceita());
            } else {
                System.out.println("Nenhuma receita foi atualizada para o ID: " + receita.getIdReceita());
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Falha na conexão com o banco de dados");
            System.out.println("Erro: " + e.getMessage());
        }
    }
}