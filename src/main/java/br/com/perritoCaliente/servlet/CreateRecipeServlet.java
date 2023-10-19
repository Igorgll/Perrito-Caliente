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
public class CreateRecipeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        String nomeReceita = req.getParameter("receita");

        Receita f = new Receita(nomeReceita);
        receitasDAO v = new receitasDAO();
        v.criarReceita(f);

        System.out.println(nomeReceita);

        resp.sendRedirect("/find-all-recipes");
    }
}
