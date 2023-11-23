package br.com.perritoCaliente.servlet;

import br.com.perritoCaliente.DAO.receitasDAO;
import br.com.perritoCaliente.DAO.usuariosDAO;
import br.com.perritoCaliente.model.ImagemReceita;
import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-recipes")
public class ListRecipesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Receita> receitas = new receitasDAO().exibirTodasReceitas();
        for (Receita receita : receitas) {
            int idUsuario = receita.getIdUsuario();
            Usuario usuario = usuariosDAO.getUsuarioById(idUsuario);
            
            if (usuario != null) {
                receita.setUsuario(usuario);
            } else {
                System.out.println("Nenhum usuário encontrado para o ID: " + idUsuario);
            }
        }

        req.setAttribute("receitas", receitas);
        req.getRequestDispatcher("recipes.jsp").forward(req, resp);

    }

}
