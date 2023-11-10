<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="br.com.perritoCaliente.model.Usuario" %>
<%@ page import="javax.servlet.http.HttpSession" %>

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
        <ul class="nav-list">
          <a href="./recipes.jsp" style="text-decoration: none; color: inherit;"><li>Receitas</li></a>
          <li>Sobre nós</li>
          <li>Contato</li>
        </ul>
        <div class="nav-buttons">
            <!-- Verificação de usuário na sessão -->
            <%
                HttpSession currentSession = request.getSession(false);
                Usuario usuarioLogado = (currentSession != null) ? (Usuario) currentSession.getAttribute("usuarioLogado") : null;

                if (usuarioLogado == null) {
            %>
                <!-- usuário não logado - exibe botões de cadastro e entrar -->
                <button class="login-btn">Cadastre-se</button>
                <button class="signup-btn">Entrar</button>
            <%
                } else {
            %>
                <!-- usuário logado - exibe mensagem de boas-vindas -->
                <div class="logged-nav" style="border: 0; display: flex; flex-direction: row; justify-content: space-between; align-items: center; gap: 20px">
                    <button style="background: red; border: 0; color: #FFFFFF">Sair</button>
                </div>
            <%
                }
            %>
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
              <div style="padding: 30px">
                <h3 style="font-size: 26px; font-weight: 600; margin-bottom: 10px;">Ratatouille Meal</h3>
                <p style="font-size: 18px; font-weight: 400;">
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rem
                  aut fuga maiores, eveniet, fugit soluta rerum eum ipsum
                  necessitatibus adipisci.
                </p>
              </div>
              <div style="display: flex; justify-content: space-between; align-items: end;">
                <div style="padding-left: 30px;">
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                </div>
                <div class="card__profile-pic" style="margin-right: 30px;">
                  <img
                    id="profile__pic"
                    src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                    alt="Foto da Ana de Armas"
                  />
                  <span style="color: #000; font-weight: 500;">Ana de Armas</span>
                </div>
              </div>
            </div>
            <div class="second-big__card">
              <div class="second-big-card__bg"></div>
              <div style="padding: 30px">
                <h3 style="font-size: 26px; font-weight: 600; margin-bottom: 10px;">Feijoada</h3>
                <p style="font-size: 18px; font-weight: 400;">
                  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Rem
                  aut fuga maiores, eveniet, fugit soluta rerum eum ipsum
                  necessitatibus adipisci.
                </p>
              </div>
              <div style="display: flex; justify-content: space-between; align-items: end;">
                <div style="padding-left: 30px;">
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                  <img src="./styles/assets/star.png" alt="Star Icon" />
                </div>
                <div class="card__profile-pic" style="margin-right: 30px;">
                  <img
                    id="profile__pic"
                    src="./styles/assets/ana-de-armas-today-square-ak.jpg"
                    alt="Foto da Ana de Armas"
                  />
                  <span style="color: #000; font-weight: 500;">Ana de Armas</span>
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
    </div>
    
    <script src="./script.js"></script>
  </body>
</html>
