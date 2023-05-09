/* DDL */
CREATE DATABASE auladml;
USE auladml;

/* DDL */
CREATE TABLE departamento (
codigo INT NOT NULL,
descricao VARCHAR(50) NOT NULL,
CONSTRAINT PK_Departamento PRIMARY KEY(codigo)
) ENGINE=INNODB;

DESC departamento;

/* DML */
INSERT INTO departamento (codigo,descricao) 
VALUES (1, 'Tecnologia da Informação');
INSERT INTO departamento (codigo,descricao) VALUES (2, 'RH');
INSERT INTO departamento (codigo,descricao) VALUES (3, 'Compras');
INSERT INTO departamento (codigo,descricao) VALUES (4, 'Almoxarifado');

/* DQL */
SELECT descricao FROM departamento;

INSERT INTO departamento VALUES (5, 'Venda');
INSERT INTO departamento (descricao,codigo) VALUES ('Diretoria',6);

SELECT * FROM departamento;

-- DELETE FROM departamento;

UPDATE departamento
  SET descricao = 'Tecnologia da Informação' WHERE codigo = 1;
UPDATE departamento
  SET descricao = 'RH' WHERE codigo = 2;
UPDATE departamento
  SET descricao = 'Compras' WHERE codigo = 3;  
UPDATE departamento
  SET descricao = 'Almoxarifado' WHERE codigo = 4;  
UPDATE departamento
  SET descricao = 'Vendas' WHERE codigo = 5;  
UPDATE departamento
  SET descricao = 'Diretoria' WHERE codigo = 6;  
  
DELETE FROM departamento WHERE codigo = 2;
DELETE FROM departamento WHERE codigo >= 5;  

SELECT * FROM departamento WHERE codigo >= 4;
SELECT * FROM departamento WHERE descricao >= 'Diretoria';
SELECT * FROM departamento WHERE descricao > 'D';

CREATE TABLE funcionario (
registro INT NOT NULL auto_increment,
nome VARCHAR(80) NOT NULL,
sexo CHAR(1),
salario DECIMAL(8,2) DEFAULT 1302,
codigo INT,
CONSTRAINT PK_Funcionario PRIMARY KEY(registro),
CONSTRAINT FK_Funcionario_Departamento FOREIGN KEY(codigo)
REFERENCES departamento(codigo)
) ENGINE=INNODB;

INSERT INTO funcionario (nome,sexo,codigo)
VALUES ('Beto','M',1);

SELECT * FROM funcionario;

INSERT INTO funcionario (nome,sexo,codigo, salario)
VALUES ('Ana','F',1, 17000);
INSERT INTO funcionario (nome,sexo,codigo, salario)
VALUES ('Maria','F',3, 12000);
INSERT INTO funcionario (nome,sexo,codigo, salario)
VALUES ('Valdo','M',3, 13000);
INSERT INTO funcionario (nome,sexo,codigo, salario)
VALUES ('Bia','F',3, 10000);
INSERT INTO funcionario (nome,sexo,codigo, salario)
VALUES ('Joca','M',4, 7000);

SELECT * FROM funcionario 
 WHERE (codigo = 3
    OR codigo = 1 )
   AND salario > 11000;
