CREATE DATABASE aula02;
USE aula02;

CREATE TABLE produto (
codigo INT UNSIGNED NOT NULL,
descricao VARCHAR(50) NOT NULL,
CONSTRAINT PK_Produto PRIMARY KEY(codigo)
) ENGINE=InnoDB;

DESC produto;

SHOW CREATE TABLE produto;

SHOW TABLES;

ALTER TABLE produto ADD COLUMN valor DECIMAL(8,2) DEFAULT 0;

CREATE TABLE deposito (
id INT NOT NULL,
descricao VARCHAR(30),
telefone VARCHAR(15),
CONSTRAINT PK_Deposito PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE estoque (
codigo INT UNSIGNED NOT NULL,
id_dep INT NOT NULL,
quantidade INT NOT NULL,
CONSTRAINT PK_Estoque PRIMARY KEY(codigo,id_dep),
CONSTRAINT FK_Estoque_Produto FOREIGN KEY(codigo) 
REFERENCES produto(codigo),
CONSTRAINT FK_Estoque_Deposito FOREIGN KEY(id_dep)
REFERENCES deposito(id)
);


DESC produto;

DROP TABLE produto;
DROP TABLE estoque;
DROP TABLE deposito;

SHOW TABLES;