<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Perrito Calliente</title>
    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/navbar.css" />
    <link rel="stylesheet" href="./styles/main.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="content-wrapper">
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

      <main>
        <form action="seu_script_de_processamento" method="post">
          <h2>Cadastro</h2>
          <span>Possui conta? <a href="#">Login</a></span>

          <label for="nome">Nome:</label>
          <input type="text" id="nome" name="nome" required />

          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required />

          <label for="usuario">Usuário:</label>
          <input type="text" id="usuario" name="usuario" required />

          <label for="senha">Senha:</label>
          <input type="password" id="senha" name="senha" required />

          <label for="confirmar-senha">Confirmar Senha:</label>
          <input
            type="password"
            id="confirmar-senha"
            name="confirmar-senha"
            required
          />

          <button type="submit">Cadastrar</button>
        </form>
      </main>
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

    <!-- <form action="/create-recipe" method="post">
      <label>Nome da Receita</label>
      <input type="text" name="recipe-name" id="recipe-name" />
      <input type="hidden" id="id" name="id" value="0" />
      <button type="submit">Registrar</button>
    </form> -->
  </body>
</html>
