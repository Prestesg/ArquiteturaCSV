CREATE TABLE Usuario (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Imagem VARCHAR(255)
);

CREATE TABLE Imagens (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDUsuario INT NOT NULL,
    Link VARCHAR(255) NOT NULL,
    IDImagem_Origem INT,
    IDImagem_Destino INT,
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID)
);

CREATE TABLE Imagens_Texto (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDImagem INT NOT NULL,
    Texto VARCHAR(255) NOT NULL,
    Parte_texto INT NOT NULL,
    FOREIGN KEY (IDImagem) REFERENCES Imagens(ID)
);

CREATE TABLE Avaliacao_Texto (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDImagem_texto INT NOT NULL,
    IDUsuario INT NOT NULL,
    Nota INT NOT NULL,
    FOREIGN KEY (IDImagem_texto) REFERENCES Imagens_Texto(ID),
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID)
);

CREATE TABLE Emocoes (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Emocoes_Texto (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDImagem_texto INT NOT NULL,
    IDEmocao INT NOT NULL,
    FOREIGN KEY (IDImagem_texto) REFERENCES Imagens_Texto(ID),
    FOREIGN KEY (IDEmocao) REFERENCES Emocoes(ID)
);

CREATE TABLE Avaliacao_Emocao (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDTexto_emocao INT NOT NULL,
    IDUsuario INT NOT NULL,
    Nota INT NOT NULL,
    FOREIGN KEY (IDTexto_emocao) REFERENCES Emocoes_Texto(ID),
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(ID)
);

CREATE TABLE Edicao_classificacao(
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDClassificacao_emocao INT NOT NULL,
    IDClassificacao_texto INT NOT NULL ,
    Texto_edit VARCHAR(255),
    IDEmocao_edit INT,
    FOREIGN KEY (IDClassificacao_emocao) REFERENCES Avaliacao_Emocao(ID),
    FOREIGN KEY (IDClassificacao_texto) REFERENCES Avaliacao_Texto(ID)
);