package br.com.perritoCaliente.servlet;

import br.com.perritoCaliente.DAO.receitasDAO;
import br.com.perritoCaliente.DAO.usuariosDAO;
import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreateUsersServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userNames = req.getParameter("user-names");
        int UserId = Integer.parseInt(req.getParameter("id"));

        Usuario usuario = new Usuario(UserId, userNames);

        if (UserId == 0) {
            usuariosDAO.criarUsuario(usuario);
        } else {
            usuariosDAO.atualizarUsuario(usuario);
        }

        resp.sendRedirect("/find-all-usuarios");
    }
}
