DROP TABLE IF EXISTS Avaliacoes;
DROP TABLE IF EXISTS Comentarios;
DROP TABLE IF EXISTS ImagensReceitas;
DROP TABLE IF EXISTS Ingredientes;
DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Receitas;
DROP TABLE IF EXISTS CategoriasReceitas;
DROP TABLE IF EXISTS Usuarios;

CREATE TABLE Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE CategoriasReceitas (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(255) NOT NULL
);

CREATE TABLE Receitas (
    idReceita INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idCategoria INT,
    titulo VARCHAR(255) NOT NULL,
    modoPreparo TEXT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario),
    FOREIGN KEY (idCategoria) REFERENCES CategoriasReceitas (idCategoria)
);

CREATE TABLE Ingredientes (
    idIngrediente INT AUTO_INCREMENT PRIMARY KEY,
    idReceita INT,
    nomeIngrediente VARCHAR(255) NOT NULL,
    FOREIGN KEY (idReceita) REFERENCES Receitas (idReceita)
);

CREATE TABLE Avaliacoes (
    idAvaliacao INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idReceita INT,
    avaliacao DECIMAL(3, 2) NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario),
    FOREIGN KEY (idReceita) REFERENCES Receitas (idReceita)
);

CREATE TABLE Comentarios (
    idComentario INT AUTO_INCREMENT PRIMARY KEY,
    idReceita INT,
    idUsuario INT,
    textoComentario TEXT NOT NULL,
    FOREIGN KEY (idReceita) REFERENCES Receitas (idReceita),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario)
);

CREATE TABLE ImagensReceitas (
    idImagem INT AUTO_INCREMENT PRIMARY KEY,
    idReceita INT,
    nomeArquivo VARCHAR(255) NOT NULL,
    imagem BLOB NOT NULL, -- binary large object para armazenar imagens
    FOREIGN KEY (idReceita) REFERENCES Receitas (idReceita)
);

CREATE TABLE Videos (
    idVideo INT AUTO_INCREMENT PRIMARY KEY,
    idReceita INT,
    urlVideo VARCHAR(255) NOT NULL,
    FOREIGN KEY (idReceita) REFERENCES Receitas (idReceita)
);

INSERT INTO USUARIOS(IDUSUARIO, NOME, EMAIL, SENHA) VALUES(1, 'iGOR', 'IGAO@GMAIL.COM', '123456');

INSERT INTO CATEGORIASRECEITAS(IDCATEGORIA, NOMECATEGORIA) VALUES(1, 'VEGETARIANO');

INSERT INTO RECEITAS(IDRECEITA, IDUSUARIO, IDCATEGORIA, TITULO, MODOPREPARO) VALUES(1, 1, 1, 'Salada Francesa', 'Só misturar um monte de folhas');

INSERT INTO AVALIACOES (IDAVALIACAO, IDUSUARIO, IDRECEITA, AVALIACAO) VALUES (1, 1, 1, 4);

INSERT INTO COMENTARIOS(IDCOMENTARIO, IDRECEITA, IDUSUARIO, TEXTOCOMENTARIO) VALUES (1, 1, 1, 'Nossa muito boa a receita, se eu pudesse comeria só salada todos os dias :)');

