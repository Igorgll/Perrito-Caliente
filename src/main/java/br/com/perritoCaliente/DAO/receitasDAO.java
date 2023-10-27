package br.com.perritoCaliente.DAO;

import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.servlet.config.ConnectionPoolConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static br.com.perritoCaliente.DAO.sqlQueries.Queries.*;

public class receitasDAO {
    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    public static void criarReceita(Receita receita) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(CRIA_RECEITA)) {
                preparedStatement.setString(1, receita.getNomeReceita());
                int affectedRows = preparedStatement.executeUpdate();
                if (affectedRows > 0) {
                    System.out.println("Receita adicionada com sucesso!");
                } else {
                    System.out.println("Falha ao adicionar a receita!");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
                int recipeId = resultSet.getInt("idReceita");

                Receita receita = new Receita(recipeName, recipeId);
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
            preparedStatement.setInt(2, receita.getIdReceita());

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
