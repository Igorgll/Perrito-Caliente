package br.com.perritoCaliente.servlet;

import br.com.perritoCaliente.DAO.usuariosDAO;
import br.com.perritoCaliente.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-account")
public class CreateAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("confirmar-senha");

        if(!senha.equals(confirmarSenha)) {
            request.setAttribute("errorMessage", "As senhas não coincidem. Tente novamente.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else {
            usuariosDAO.criarUsuario(new Usuario(nome, email, usuario, senha));
            response.sendRedirect("login.jsp");
        }
    }
}
