<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="br.com.perritoCaliente.model.Receita" %>
<%@ page import="br.com.perritoCaliente.model.Usuario" %>
<%@ page import="br.com.perritoCaliente.model.Ingrediente" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="br.com.perritoCaliente.DAO.receitasDAO" %>
<%@ page import="br.com.perritoCaliente.DAO.usuariosDAO" %>

<%
    int idReceita = Integer.parseInt(request.getAttribute("idReceita").toString());

    Receita receita = new receitasDAO().getReceitaById(idReceita);
    
    Usuario usuario = usuariosDAO.getUsuarioById(receita.getIdUsuario());

    request.setAttribute("receita", receita);
    request.setAttribute("usuario", usuario);
%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Página inicial</title>
    <link rel="icon" href="./styles/assets/favicon-32x32.png" type="image/x-icon">
    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/navbar.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <link rel="stylesheet" href="./styles/banner.css" />
    <link rel="stylesheet" href="./styles/userDashboard.css" />
    <link rel="stylesheet" href="./styles/indexContent.css" />
    <link rel="stylesheet" href="./styles/recipeDescription.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="wrapper">
        <nav>
            <a href="index.jsp">
              <div class="logo">
                <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
              </div>
            </a>
            <ul class="nav-list" style="margin-bottom: 0">
              <a href="./recipes.jsp" style="text-decoration: none; color: inherit"
                ><li>Receitas</li></a
              >
              <li>Sobre nós</li>
              <li>Contato</li>
            </ul>
            <div class="nav-buttons">
              <!-- Verificação de usuário na sessão -->
              <% HttpSession currentSession = request.getSession(false); Usuario
              usuarioLogado = (currentSession != null) ? (Usuario)
              currentSession.getAttribute("usuarioLogado") : null; if (usuarioLogado
              == null) { %>
              <!-- usuário não logado - exibe botões de cadastro e entrar -->
              <a href="./signup.jsp" style="text-decoration: none; color: inherit"
                ><button class="login-btn">Cadastre-se</button></a
              >
              <a href="./login.jsp" style="text-decoration: none; color: inherit"
                ><button class="signup-btn">Entrar</button></a
              >
              <% } else { %>
              <!-- usuário logado -->
              <div
                class="logged-nav"
                style="
                  display: flex;
                  flex-direction: row;
                  align-items: center;
                  justify-content: center;
                  border: 0;
                  display: flex;
                  flex-direction: row;
                  justify-content: space-between;
                  align-items: center;
                  gap: 20px;
                "
              >
                <a
                  href="./userDashboard.jsp"
                  style="text-decoration: none; color: inherit"
                >
                  <span style="color: #000"
                    >Bem-vindo, <%= usuarioLogado.getNome() %></span
                  >
                </a>
                <div
                  style="
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    justify-content: center;
                  "
                >
                  <button
                    class="login-btn"
                    id="openModalBtn"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                  >
                    Adicionar receita
                  </button>
                </div>
                <div>
                  <form action="logout" method="post">
                    <button
                      class="login-btn"
                      style="
                        width: 150px;
                        height: 46px;
                        font-size: 18px;
                        border-radius: 6px;
                        border: none;
                        background: var(--orange);
                        color: var(--light);
                        cursor: pointer;
                        margin: 0;
                      "
                    >
                      Sair
                    </button>
                  </form>
                </div>
              </div>
              <% } %>
            </div>
          </nav>

          <div class="description">
            <div class="description-content">
                <h1 id="recipe-title"><%= receita.getNomeReceita() %></h1>
                <div class="description-wrapper">
                    <div class="description-text">
                        <h2>Ingredientes</h2>
                        <ul style="list-style-type: none; padding: 0;">
                          <% if (receita.getIngredientes() != null) { %>
                              <% for (Ingrediente ingrediente : receita.getIngredientes()) { %>
                                  <li style="margin-bottom: 10px; width: 20px;"><%= ingrediente.getNomeIngrediente() %></li>
                              <% } %>
                          <% } else { %>
                              <li>Nenhum ingrediente disponível</li>
                          <% } %>
                      </ul>
                        <div style="margin-top: 40px;">
                            <h2>Modo de Preparo</h2>
                            <p><%= receita.getModoPreparo() %></p>
                        </div>
                        <div style="margin-top: 40px;" class="video-container">
                          <h2>Tutorial no Youtube</h2>
                          <a href="<%= receita.getUrlVideo() %>" target="_blank" style="color: #000;"><%= receita.getUrlVideo() %></a>
                      </div>
                    </div>
                    <div class="description-image">
                        <div class="description-image-wrapper">
                        <img src="<%= receita.getCaminhoImagem() %>" alt="Foto da receita">
                        <div class="recipe-user-info">
                            <div class="recipe-user-profile">
                                <div class="recipe-user-profile-pic">
                                    <img
                                        id="recipe-profile__pic"
                                        src="./styles/assets/profile.png"
                                        alt="Foto da Ana de Armas"
                                    />
                                    <span class="limited-text"><%= receita.getUsuario().getUsuario() %></span>
                                </div>
                                <div class="recipe-user-stars">
                                    <img src="./styles/assets/star.png" alt="Star icon" />
                                    <img src="./styles/assets/star.png" alt="Star icon" />
                                    <img src="./styles/assets/star.png" alt="Star icon" />
                                    <img src="./styles/assets/star.png" alt="Star icon" />
                                    <img src="./styles/assets/star.png" alt="Star icon" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
          </div>

          <footer>
            <div class="logo-footer">
              <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
            </div>
            <div class="line"></div>
            <span id="copyright">@Copyright. All rights reserved.</span>
            <div class="disclaimer-container">
              <span id="disclaimer">Projeto desenvolvido sem fins lucrativos.</span>
            </div>
          </footer>

      <!-- MODAL -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Adicionar Receita</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="/create-recipe" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="mb-3">
                  <label for="exampleInput" class="form-label">Nome da Receita</label>
                  <input type="text" name="recipe-name" id="recipe-name" value="${param.name}" class="form-control">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Modo de Preparo</label>
                  <textarea class="form-control" type="text" placeholder="Digite o modo de preparo" name="recipe-preparation" id="recipe-preparation" rows="5" value="${param.name}" class="form-control"></textarea>
                </div>
                <div class="mb-3">
                  <label for="ingredientes" class="form-label">Ingredientes</label>
                  <textarea class="form-control" name="recipe-ingredient" id="recipe-ingredient" value="${param.name}" rows="5" placeholder="Digite os ingredientes, um por linha"></textarea>
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Imagem da Receita</label>
                  <input type="file" class="form-control" name="image" id="image" aria-describedby="inputGroupFileAddon" accept="image/*">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Link do vídeo da receita</label>
                  <input type="text" name="recipe-video" id="recipe-video" value="${param.name}" class="form-control">
                </div>
                <div class="modal-footer">
                 <button type="submit" class="btn btn-primary">Postar receita</button>
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>

    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    </div>
  </body>