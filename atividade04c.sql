CREATE DATABASE RpgResposta;

USE RpgResposta;

CREATE TABLE Usuarios
(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(150) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
);


CREATE TABLE Classes
(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(150) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
);

DROP TABLE Usuarios

CREATE TABLE Habilidades
(
	HabilidadesId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE Personagens
(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(10) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
);

CREATE TABLE ClassesHabilidades
(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadesId INT FOREIGN KEY REFERENCES Habilidades(HabilidadesId)
);

-- INSERÇÃO DE DADOS
INSERT INTO Usuarios VALUES ('Danos','Senha123');
INSERT INTO Classes VALUES ('Monge','Descricao do monge');
INSERT INTO Habilidades VALUES ('Recuperar vida');
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('BitBug', 1, 1);
INSERT INTO ClassesHabilidades (ClasseId, HabilidadesId) VALUES (1,1);

-- EXCLUSÃO DE DADOS
DELETE FROM Usuarios WHERE UsuarioId = 2;

-- ALTERAÇÃO DE DADOS
UPDATE Usuarios SET Email = 'Danox' WHERE Email = 'Danos';

-- CONSULTA DE DADOS
SELECT * FROM Usuarios;
SELECT ClasseId, Nome, Descricao FROM Classes;
SELECT * FROM Habilidades;
SELECT * FROM ClassesHabilidades;
SELECT * FROM Personagens;
