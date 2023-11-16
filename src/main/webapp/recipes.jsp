<%@ page contentType="text/html; charset=UTF-8" %> <%@ page
import="br.com.perritoCaliente.model.Usuario" %> <%@ page
import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Página inicial</title>
    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/navbar.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <link rel="stylesheet" href="./styles/banner.css" />
    <link rel="stylesheet" href="./styles/indexContent.css" />
    <link rel="stylesheet" href="./styles/recipes.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
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
            <span style="color: #000"
              >Bem-vindo, <%= usuarioLogado.getNome() %></span
            >
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
      <div class="banner" style="height: 390px">
        <h1>Confira todas receitas</h1>
      </div>
      <div class="index__content" style="padding: 20px 70px">
        <div class="categories__searchBar">
          <select name="cars" id="cars" style="color: #7F8899;">
            <option value="" hidden>Selecione uma categoria</option>
            <option value="Picanha">Picanha</option>
            <option value="Light">Light</option>
            <option value="Doces">Doces</option>
            <option value="Petiscos">Petiscos</option>
          </select>
          <div class="search-input_wrapper">
            <input
              type="text"
              name=""
              id=""
              placeholder="Pesquise uma receita ou igrediente"
            />
            <button id="search__button" style="height: 45px; width: 200px;">Pesquisar</button>
          </div>
        </div>
        <div class="all__recipes">
          <ul
            style="
              display: grid;
              grid-template-columns: 1fr 1fr 1fr 1fr;
              gap: 20px;
              list-style: none;
              padding: 20px 0 40px 0;
            "
          >
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
    </div>
  </body>
</html>
