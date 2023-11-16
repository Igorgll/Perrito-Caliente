package br.com.perritoCaliente.servlet;
import br.com.perritoCaliente.model.ImagemReceita;
import br.com.perritoCaliente.DAO.receitasDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
@WebServlet
public class AddImageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imgName = req.getParameter("img-name");
        String imgPath = req.getParameter("img-path");




    }
}
