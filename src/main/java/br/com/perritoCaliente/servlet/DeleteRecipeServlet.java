package br.com.perritoCaliente.servlet;

import br.com.perritoCaliente.DAO.receitasDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-recipe")
public class DeleteRecipeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String recipeIdString = req.getParameter("idReceita");
        int  recipeIdInt = Integer.parseInt(recipeIdString);
        new receitasDAO().deletarReceitaPorId(recipeIdInt);

        resp.sendRedirect("/find-all-recipes");

    }

}