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
        req.setCharacterEncoding("UTF-8");
        System.out.println("Recebendo solicitação de exclusão...");

        if ("DELETE".equals(req.getParameter("_method"))) {
            String recipeIdString = req.getParameter("idReceita");
            int recipeIdInt = Integer.parseInt(recipeIdString);
            System.out.println("ID da Receita a ser excluída: " + recipeIdInt); 

            new receitasDAO().deletarReceitaPorId(recipeIdInt);

            resp.sendRedirect("/user-dashboard");
        } else {
            System.out.println("Método não permitido.");
            resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Método não permitido");
        }
    }

}