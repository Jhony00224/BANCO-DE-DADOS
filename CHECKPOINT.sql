CREATE DATABASE IF NOT EXISTS games;
USE games;

CREATE TABLE IF NOT EXISTS usuario (
	idUsuario INT NOT NULL,
    nomeusuario VARCHAR(45) NULL,
    data_nac DATE NULL,
    sexo VARCHAR(1) NULL,
    email VARCHAR(150) NULL,
    senha VARCHAR(45) NULL,
    PRIMARY KEY (idUsuario)
);

CREATE TABLE IF NOT EXISTS jogos (
idJogos INT NOT NULL,
idUsuario INT NULL,
datafabricacao DATE,
qtd_Dowloads INT NULL,
PRIMARY KEY (idJogos),
FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE IF NOT EXISTS fabricante (
idFabricante INT NOT NULL,
idJogos INT NOT NULL,
nome_jogo VARCHAR(40) NULL,
PRIMARY KEY (idFabricante),
FOREIGN KEY (idJogos) REFERENCES jogos (idJogos)
);

CREATE TABLE IF NOT EXISTS genero (
idGenero INT NOT NULL ,
tipo VARCHAR (30) NULL,
idFabricante INT NULL,
PRIMARY KEY (idGenero),
FOREIGN KEY (idFabricante) REFERENCES fabricante(idFabricante)
);

CREATE TABLE IF NOT EXISTS endereco (
idEndereco INT NOT NULL,
idUsuario INT,
cep VARCHAR (20) NULL,
estado VARCHAR (50) NULL,
pais VARCHAR (50) NULL,
cidade VARCHAR (20) NULL,
PRIMARY KEY (idEndereco),
FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE IF NOT EXISTS form_pgm (
 idPagamento INT NOT NULL,
 idJogos INT NULL,
 cartao_credito VARCHAR (20) NULL,
 pix VARCHAR(20) NULL,
 pgm_boleto VARCHAR(20) NULL,
 debito VARCHAR (20) NULL,
 PRIMARY KEY (idPagamento),
 FOREIGN KEY (idJogos) REFERENCES jogos (idJogos)
 );
 

CREATE TABLE IF NOT EXISTS pedido(
 idPedido INT NOT NULL,
 idJogos INT NULL,
 datacompra DATETIME,
 idPagamento INT,
 PRIMARY KEY (idPedido),
 FOREIGN KEY (idPagamento) REFERENCES form_pgm(idPagamento)
 );