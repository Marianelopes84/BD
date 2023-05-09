CREATE DATABASE aula01;
USE aula01;

CREATE TABLE departamento (
codigo INT UNSIGNED NOT NULL,
descricao VARCHAR(50),
CONSTRAINT PK_Departamento PRIMARY KEY (codigo)
) ENGINE=INNODB;


DROP TABLE departamento;
DESCRIBE departamento;
DESC departamento;

CREATE TABLE funcionario (
id INT NOT NULL,
nome varchar(80) NOT NULL,
sexo CHAR(1) NULL,
nascimento DATE NULL,
salario DECIMAL(8,2) NULL,
email VARCHAR(30) NULL,
cod_depto INT UNSIGNED NOT NULL,
CONSTRAINT PK_Funcionario PRIMARY KEY(id),
CONSTRAINT FK_Funcionario_Departamento foreign 
key(cod_depto) REFERENCES departamento(codigo),
CONSTRAINT CHK_Salario CHECK(salario > 0),
CONSTRAINT UK_MAIL UNIQUE(email)
) ENGINE=INNODB;

desc funcionario;

CREATE TABLE estado (
uf CHAR(2) NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL
);

DESC estado;

CREATE TABLE produto (
grupo INT NOT NULL PRIMARY KEY,
codigo INT NOT NULL PRIMARY KEY,
descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produto (
grupo INT NOT NULL,
codigo INT NOT NULL,
descricao VARCHAR(50) NOT NULL,
CONSTRAINT PRIMARY KEY(grupo,codigo)
);

DESC produto;

INSERT INTO departamento (codigo, descricao)
VALUES (1, 'TI');
INSERT INTO departamento (codigo, descricao)
VALUES (2, 'RH');
INSERT INTO departamento (codigo, descricao)
VALUES (3, 'Compras');
INSERT INTO departamento (codigo, descricao)
VALUES (4, 'TI');

SELECT * FROM departamento;

INSERT INTO funcionario (id,nome,sexo,nascimento,salario,email,cod_depto)
VALUES (1,'Beto','M','1980-01-25',5850.30,'beto@xpto.com.br',1);
INSERT INTO funcionario (id,nome,sexo,nascimento,salario,email,cod_depto)
VALUES (2,'Ana Flávia','F','2000-02-29',5850.30,'anaf@xpto.com.br',3);
INSERT INTO funcionario (id,nome,sexo,nascimento,salario,email,cod_depto)
VALUES (3,'Ana Fernanda','F','2000-02-29',5850.30,'anaf@xpto.com.br',3);

DELETE FROM departamento WHERE codigo = 4;

SELECT * FROM departamento;

DROP TABLE funcionario;
DROP TABLE departamento;