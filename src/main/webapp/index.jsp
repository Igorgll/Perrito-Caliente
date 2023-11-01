<%@ page contentType="text/html; charset=UTF-8" %>
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
        <div class="logo">
          <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
        </div>
        <ul class="nav-list">
          <li>Receitas</li>
          <li>Sobre nós</li>
          <li>Contato</li>
        </ul>
        <div class="nav-buttons">
          <button>Cadastre-se</button>
          <button>Entrar</button>
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
