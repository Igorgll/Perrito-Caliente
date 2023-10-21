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

        String idReceitas = req.getParameter("idReceita");

        int idReceitasint = Integer.parseInt(idReceitas);


        String Receitas = req.getParameter("nomeReceita");

        Receita f = new Receita(Receitas, idReceitasint);

        receitasDAO v = new receitasDAO();

        v.criarReceita(f);

        System.out.println(Receitas);

        if (idReceitas.isBlank()) {

            receitasDAO.criarReceita(f);

        } else {

            receitasDAO.atualizarReceita(f);
        }


        resp.sendRedirect("/find-all-recipes");

    }
}



