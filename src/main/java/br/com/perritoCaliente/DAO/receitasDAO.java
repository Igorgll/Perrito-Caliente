package br.com.perritoCaliente.DAO;

import br.com.perritoCaliente.model.Receita;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import static br.com.perritoCaliente.DAO.sqlQueries.Queries.*;

public class receitasDAO {

    public void criarReceita(Receita receita) {

        //String SQL = "";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("Conexão bem sucedida");

            PreparedStatement preparedStatement = connection.prepareStatement(CRIA_RECEITA);

            preparedStatement.setString(1, receita.getNomeReceita());
            preparedStatement.execute();

            System.out.println("Receita adicionada com sucesso!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Falha ao adicionar a receita");
        }

    }

}
