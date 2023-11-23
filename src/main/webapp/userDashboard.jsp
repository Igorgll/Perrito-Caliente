<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="br.com.perritoCaliente.model.Receita" %>
<%@ page import="br.com.perritoCaliente.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <div class="wrapper" style="position: relative;">
      <nav>
        <a href="index.jsp">
          <div class="logo">
            <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
          </div>
        </a>
        <ul class="nav-list" style="margin-bottom: 0">
          <a href="/find-all-recipes" style="text-decoration: none; color: inherit"
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

      <div
        style="
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          padding: 40px 70px;
          background: #eee;
        "
      >
        <div class="control-panel">
          <div class="panel-content">
            <aside>
              <div class="profile">
                <div class="profile-img">
                  <img
                    src="./styles/assets/profile.png"
                    alt="Generic profile icon"
                  />
                  <h4><%= usuarioLogado.getNome() %></h4>
                  <h5 style="color: #a8a8a8; font-weight: 400;">@<%= usuarioLogado.getEmail() %></h5>
                </div>
              </div>
              <div class="aside-options">
                <span>🥘 Minhas receitas</span>
                <span>⭐ Avaliações</span>
              </div>
            </aside>
            <div class="my-recipes">
              <div class="my-recipes-banner">
                <h2>Minha receitas</h2>
              </div>
              <div class="my-recipes-content">
                <c:if test="${not empty receitasDoUsuario}">
                  <c:forEach var="receita" items="${receitasDoUsuario}">
                    <a style="all: unset;" href="recipe-description?idReceita=${receita.idReceita}">
                    <div class="custom-recipe__card" style="max-width: 400px; cursor: pointer;">
                    <div class="custom-card__background">
                      <div class="custom-card__profile">
                        <div class="custom-card__profile-pic">
                          <img
                            id="custom-profile__pic"
                            src="./styles/assets/profile.png"
                            alt="Foto da Ana de Armas"
                          />
                          <span class="limited-text"><%= usuarioLogado.getEmail() %></span>
                        </div>
                        <div class="custom-card__stars">
                          <img src="./styles/assets/star.png" alt="Star icon" />
                          <img src="./styles/assets/star.png" alt="Star icon" />
                          <img src="./styles/assets/star.png" alt="Star icon" />
                          <img src="./styles/assets/star.png" alt="Star icon" />
                          <img src="./styles/assets/star.png" alt="Star icon" />
                        </div>
                      </div>
                      <img
                        style="border-top-right-radius: 10px; border-top-left-radius: 10px;"
                        src="${receita.caminhoImagem}"
                        alt="Image da Receita"
                      />
                    </div>
                    <div class="custom-card__description">
                            <p>${receita.getNomeReceita()}</p>
                        <div class="custom-card__buttons">
                          <a href="user-dashboard?editRecipeId=${receita.getIdReceita()}" style="width: 45%; color: white; background: transparent; border: 1px; border-color: var(--orange);">
                            <button class="edit-btn" id="edit-btn" style="margin: 0; width: 100%; height: 100%; color: var(--orange); width: 100%; transition: all 0.6s;">
                              Editar
                            </button>
                          </a>
                        <form  action="delete-recipe" method="POST" style="width: 45%;">
                          <input type="hidden" name="_method" value="DELETE">
                          <input type="hidden" name="idReceita" value="${receita.getIdReceita()}">
                          <button style="margin: 0; width: 100%; height: 100%; border: none; color: #FFFFFF; background-color: red; transition: none;" type="submit">
                            Excluir
                          </button>
                        </form>
                        </div>
                    </div>
                  </div>
                  </a>
                </c:forEach>
              </c:if>
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
              <form action="/create-recipe" method="post" enctype="multipart/form-data">
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

<!-- MODAL DE EDIÇÃO -->
<div class="modal fade" id="form-edit-recipe" tabindex="-1" aria-labelledby="form-edit-recipe" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="form-edit-recipe">Editar Receita</h1>
        <button type="button" class="btn-close" id="close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/update-recipe" method="post" enctype="multipart/form-data">
          <%-- Verifica se há detalhes da receita para edição --%>
          <c:if test="${not empty receitaParaEdicao}">
            <div class="mb-3">
              <label for="exampleInput" class="form-label">Nome da Receita</label>
              <input type="text" name="recipe-name" id="recipe-name" value="${receitaParaEdicao.nomeReceita}" class="form-control">
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Modo de Preparo</label>
              <textarea class="form-control" type="text" name="recipe-preparation" id="recipe-preparation" rows="5">${receitaParaEdicao.modoPreparo}</textarea>
            </div>
            <div class="mb-3">
              <label for="ingredientes" class="form-label">Ingredientes</label>
              <textarea class="form-control" name="recipe-ingredient" id="recipe-ingredient" rows="5">
                <c:forEach var="ingrediente" items="${receitaParaEdicao.ingredientes}" varStatus="loop">
                  ${ingrediente.nomeIngrediente}
                  <c:if test="${!loop.last}">, </c:if>
                </c:forEach>
              </textarea>
            </div>
            <div class="mb-3">
              <label for="inputGroupFile" class="form-label">Imagem da Receita</label>
              <input type="file" class="form-control" name="image" id="image" aria-describedby="inputGroupFileAddon" accept="image/*">
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Link do vídeo da receita</label>
              <input type="text" name="recipe-video" id="recipe-video" value="${receitaParaEdicao.urlVideo}" class="form-control">
            </div>
          </c:if>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Editar receita</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

  <style>
    #edit-btn:hover {
      background: var(--orange) !important;
      color: white !important;
    }
  </style>

    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.edit-btn').forEach(function (button) {
          button.addEventListener('click', function (event) {
            event.preventDefault();
    
            var editForm = new bootstrap.Modal(document.getElementById('form-edit-recipe'));
            editForm.show();
          });
        });
      });
    </script>
  </body>
</html>
