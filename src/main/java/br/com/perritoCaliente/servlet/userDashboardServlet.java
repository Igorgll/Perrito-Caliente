package br.com.perritoCaliente.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.perritoCaliente.DAO.receitasDAO;
import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.model.Usuario;

@WebServlet("/user-dashboard")
public class userDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession currentSession = request.getSession(false);
        Usuario usuarioLogado = (currentSession != null) ? (Usuario) currentSession.getAttribute("usuarioLogado")
                : null;

        if (usuarioLogado != null) {
            List<Receita> receitasDoUsuario = receitasDAO.obterReceitasDoUsuarioPorId(usuarioLogado.getIdUsuario());
            request.setAttribute("receitasDoUsuario", receitasDoUsuario);
        }

        request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
    }
}
