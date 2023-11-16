package br.com.perritoCaliente.servlet;
import br.com.perritoCaliente.model.ImagemReceita;
import br.com.perritoCaliente.model.Receita;
import br.com.perritoCaliente.DAO.receitasDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.apache.commons.fileupload.servlet.ServletFileUpload.isMultipartContent;


@WebServlet("/create-recipe")
public class CreateRecipesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Map<String, String> parameters = uploadImage(req);

        //String recipeName = parameters.get("recipe-name");
        //int recipeId = Integer.parseInt(parameters.get("id"));
        String image = parameters.get("image");

        //Receita receita = new Receita(recipeName, recipeId);
        ImagemReceita img = new ImagemReceita(image);
        receitasDAO.inserirImagem(img);
        /*if (recipeId == 0) {
            //receitasDAO.inserirReceita(receita);
            receitasDAO.inserirImagem(img);
        } else {
            receitasDAO.atualizarReceita(receita);
        }*/

        //resp.sendRedirect("/find-all-recipes");
    }

    private Map<String, String> uploadImage(HttpServletRequest httpServletRequest) {
        Map<String, String> requestParameters = new HashMap<>();
        if (isMultipartContent(httpServletRequest)) {
            try {
                DiskFileItemFactory  diskFileItemFactory = new DiskFileItemFactory();
                List<FileItem> fileItems = new ServletFileUpload(diskFileItemFactory).parseRequest(httpServletRequest);
                for (FileItem fileItem : fileItems) {
                    checkFieldType(fileItem, requestParameters);
                }
            } catch (Exception ex) {
                requestParameters.put("image", "img/default-img.jpg");
            }
        }
        return requestParameters;
    }

    private void checkFieldType(FileItem item, Map requestParameters) throws Exception {
        if (item.isFormField()) {
            requestParameters.put(item.getFieldName(), item.getString());
        } else {
            String fileName = processUploadedFile(item);
            requestParameters.put("image", "img/".concat(fileName));
        }
    }

    private String processUploadedFile(FileItem fileItem) throws Exception {
        Long currentTime = new Date().getTime();
        String fileName = currentTime.toString().concat("-").concat(fileItem.getName().replace(" ", ""));
        String filePath = this.getServletContext().getRealPath("img").concat(File.separator).concat(fileName);
        fileItem.write(new File(filePath));
        return fileName;
    }

}

