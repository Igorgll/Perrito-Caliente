package br.com.perritoCaliente.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.perritoCaliente.DAO.receitasDAO;
import br.com.perritoCaliente.model.Receita;

@WebServlet("/update-recipe")
public class UpdateRecipeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String nomeReceita = request.getParameter("recipe-name");
        String modoPreparo = request.getParameter("recipe-preparation");

        Receita receitaAtualizada = new Receita();
        receitaAtualizada.setNomeReceita(nomeReceita);
        receitaAtualizada.setModoPreparo(modoPreparo);

        receitasDAO.atualizarReceita(receitaAtualizada);

        response.sendRedirect("/find-all-recipes");
    }
}
