package br.com.perritoCaliente.servlet;

import br.com.perritoCaliente.DAO.receitasDAO;
import br.com.perritoCaliente.model.Receita;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-recipes")
public class ListRecipeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Receita> receitas = new receitasDAO().findAllCars();

        req.setAttribute("receitas", receitas);

        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);

        super.doGet(req, resp);

    }

}
