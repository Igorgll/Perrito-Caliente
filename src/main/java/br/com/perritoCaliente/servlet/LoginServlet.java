package br.com.perritoCaliente.servlet;

import br.com.perritoCaliente.DAO.usuariosDAO;
import br.com.perritoCaliente.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        Usuario user = usuariosDAO.autenticaUsuario(usuario, senha);
        //Talvez retornar o ID do usuario para ficar armazenado na sessão, útil na hora de deletar receitas baseado no id do usuario

        if(user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", user);
            response.sendRedirect("index.jsp");
        } else {
            System.out.println("Usuário ou senha inválidos. Tente novamente.");
            request.setAttribute("errorMessage", "Usuário ou senha inválidos. Tente novamente.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}

