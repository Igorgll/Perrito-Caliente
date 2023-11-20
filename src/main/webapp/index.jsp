<%@ page contentType="text/html; charset=UTF-8" %> <%@ page
import="br.com.perritoCaliente.model.Usuario" %> <%@ page
import="javax.servlet.http.HttpSession" %>

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
    <div class="wrapper">
      <nav>
        <a href="index.jsp">
          <div class="logo">
            <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
          </div>
        </a>
          <ul class="nav-list" style="margin-bottom: 0;">
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
          <a href="./userDashboard.jsp" style="text-decoration: none; color: inherit">
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
                data-bs-toggle="modal" data-bs-target="#exampleModal"
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
      <div class="banner">
        <h1>Descubra novas receitas</h1>
        <div class="searchBar">
          <div class="input-wrapper">
            <input
              type="text"
              name="Pesquisar"
              id=""
              placeholder="Pesquise uma receita ou ingrediente"
            />
            <button id="search__button">Pesquisar</button>
          </div>
        </div>
      </div>
      <div class="index__content">
        <section class="recipes__carousel">
          <div class="carousel__container">
            <ul>
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                        alt="Foto da Ana de Armas"
                      />
                      <span>Ana de Armas</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                    src="./styles/assets/cuzcuz.png"
                    alt="Image do Cuzcuz Paulista"
                  />
                </div>
                <div class="card__description">
                  <p>Cuzcuz Paulista com tomate, ovo, azeitonas...</p>
                </div>
              </li>
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                        alt="Foto da Ana de Armas"
                      />
                      <span>Ana de Armas</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                    src="./styles/assets/cuzcuz.png"
                    alt="Image do Cuzcuz Paulista"
                  />
                </div>
                <div class="card__description">
                  <p>Cuzcuz Paulista com tomate, ovo, azeitonas...</p>
                </div>
              </li>
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                        alt="Foto da Ana de Armas"
                      />
                      <span>Ana de Armas</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                    src="./styles/assets/cuzcuz.png"
                    alt="Image do Cuzcuz Paulista"
                  />
                </div>
                <div class="card__description">
                  <p>Cuzcuz Paulista com tomate, ovo, azeitonas...</p>
                </div>
              </li>
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                        alt="Foto da Ana de Armas"
                      />
                      <span>Ana de Armas</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                    src="./styles/assets/cuzcuz.png"
                    alt="Image do Cuzcuz Paulista"
                  />
                </div>
                <div class="card__description">
                  <p>Cuzcuz Paulista com tomate, ovo, azeitonas...</p>
                </div>
              </li>
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                        alt="Foto da Ana de Armas"
                      />
                      <span>Ana de Armas</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                    src="./styles/assets/cuzcuz.png"
                    alt="Image do Cuzcuz Paulista"
                  />
                </div>
                <div class="card__description">
                  <p>Cuzcuz Paulista com tomate, ovo, azeitonas...</p>
                </div>
              </li>
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                        alt="Foto da Ana de Armas"
                      />
                      <span>Ana de Armas</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                    src="./styles/assets/cuzcuz.png"
                    alt="Image do Cuzcuz Paulista"
                  />
                </div>
                <div class="card__description">
                  <p>Cuzcuz Paulista com tomate, ovo, azeitonas...</p>
                </div>
              </li>
            </ul>
          </div>
        </section>
        <section class="another__recipes">
          <h2>Outras receitas</h2>
          <div class="big-cards__section">
            <div class="first-big__card">
              <div class="big-card__bg"></div>
              <div style="padding: 30px"">
                <h3
                  style="font-size: 26px; font-weight: 600; margin-bottom: 10px"
                >
                  Ratatouille Meal
                </h3>
                <p style="font-size: 18px; font-weight: 400">
                  Ratatouille Meal: uma mistura requintada de vegetais frescos, oferecendo uma experiência culinária única e deliciosa. Sabores perfeitamente combinados para paladares exigentes.
                </p>
              </div>
              <div
                style="
                  display: flex;
                  justify-content: space-between;
                  align-items: end;
                "
              >
                <div style="padding-left: 30px">
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                </div>
                <div class="card__profile-pic" style="margin-right: 30px">
                  <img
                    id="profile__pic"
                    src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                    alt="Foto da Ana de Armas"
                  />
                  <span style="color: #000; font-weight: 500"
                    >Ana de Armas</span
                  >
                </div>
              </div>
            </div>
            <div class="second-big__card">
              <div class="second-big-card__bg"></div>
              <div style="padding: 30px">
                <h3
                  style="font-size: 26px; font-weight: 600; margin-bottom: 10px"
                >
                  Feijoada
                </h3>
                <p style="font-size: 18px; font-weight: 400">
                  Feijoada irresistível, com feijão preto, carne suculenta e ingredientes especiais. Um prato autêntico que proporciona uma explosão de sabores e tradição brasileira em cada garfada.
                </p>
              </div>
              <div
                style="
                  display: flex;
                  justify-content: space-between;
                  align-items: end;
                "
              >
                <div style="padding-left: 30px">
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                </div>
                <div class="card__profile-pic" style="margin-right: 30px">
                  <img
                    id="profile__pic"
                    src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                    alt="Foto da Ana de Armas"
                  />
                  <span style="color: #000; font-weight: 500"
                    >Ana de Armas</span
                  >
                </div>
              </div>
            </div>
          </div>
        </section>

        <div class="see-all__recipes">
          <a href="./recipes.jsp"><button>Veja todas as receitas</button></a>
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
              <form>
                <div class="mb-3">
                  <label for="exampleInput" class="form-label">Nome da Receita</label>
                  <input type="text" class="form-control">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Modo de Preparo</label>
                  <input type="text" class="form-control">
                </div>
                <div class="mb-3">
                  <label for="ingredientes" class="form-label">Ingredientes</label>
                  <textarea class="form-control" id="ingredientes" rows="5" placeholder="Digite os ingredientes, um por linha"></textarea>
                </div>
                <div class="mb-3">
                  <label class="form-label">Tipo da Receita</label>
                  <select class="form-select" aria-label="Default select example">
                    <option selected>Tipo</option>
                    <option value="1">Vegetariana</option>
                    <option value="2">Vegana</option>
                    <option value="3">Carne</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Imagem da Receita</label>
                  <input type="file" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon">
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Outras Imagens (opcional)</label>
                  <input type="file" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon">
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Outras Imagens (opcional)</label>
                  <input type="file" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon">
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Outras Imagens (opcional)</label>
                  <input type="file" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon">
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Outras Imagens (opcional)</label>
                  <input type="file" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon">
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Outras Imagens (opcional)</label>
                  <input type="file" class="form-control" id="inputGroupFile" aria-describedby="inputGroupFileAddon">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Link do vídeo da receita</label>
                  <input type="text" class="form-control">
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Postar receita</button>
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
  </body>
</html>
