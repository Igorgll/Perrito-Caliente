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
    avaliacao DECIMAL(3, 2), -- entre 0 e 5
    FOREIGN KEY (idUsuario) REFERENCES Usuarios (idUsuario),
    FOREIGN KEY (idCategoria) REFERENCES CategoriasReceitas (idCategoria)
);

CREATE TABLE Ingredientes (
    idIngrediente INT AUTO_INCREMENT PRIMARY KEY,
    idReceita INT,
    nomeIngrediente VARCHAR(255) NOT NULL,
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

INSERT INTO RECEITAS(IDRECEITA, IDUSUARIO, IDCATEGORIA, TITULO, MODOPREPARO, AVALIACAO)   VALUES(1, 1, 1, 'Macarrao', 'sla', 5);

INSERT INTO USUARIOS(IDUSUARIO, NOME, EMAIL, SENHA)   VALUES(1, 'iGOR', 'IGAO@GMAIL.COM', '123456');

INSERT INTO CATEGORIASRECEITAS(IDCATEGORIA, NOMECATEGORIA)   VALUES(1, 'VEGANO');
