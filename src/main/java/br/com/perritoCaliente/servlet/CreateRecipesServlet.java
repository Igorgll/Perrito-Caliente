package br.com.perritoCaliente.servlet;
import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.DAO.receitasDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-recipe")
public class CreateRecipesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String recipeName = req.getParameter("recipe-name");
        int recipeId = Integer.parseInt(req.getParameter("id"));

        Receita receita = new Receita(recipeName, recipeId);

        if (recipeId == 0) {
            receitasDAO.criarReceita(receita);
        } else {
            receitasDAO.atualizarReceita(receita);
        }

        resp.sendRedirect("/find-all-recipes");
    }
}

