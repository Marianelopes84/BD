CREATE DATABASE Trabalho;
USE Trabalho;
CREATE TABLE Cidade(
	idcidade INT NOT NULL auto_increment,
    descricao VARCHAR(50),
    primary key(idcidade)
) ENGINE=INNODB;
CREATE TABLE Departamento (
	iddepartamento INT NOT NULL auto_increment,
    descricao VARCHAR(45),
    telefone VARCHAR(15),
    cidadeid int,
    primary key(iddepartamento),
    foreign key(cidadeid) references Cidade(idcidade)
)ENGINE=INNODB;
CREATE TABLE Funcionario(
	idfuncionario INT NOT NULL auto_increment,
    Nome VARCHAR(80),
    Nascimento DATE,
    Sexo CHAR(1),
    Admissao datetime,
    Salario DECIMAL(8,2),
    departamentoid INT,
    primary key(idfuncionario),
    foreign key(departamentoid) references Departamento (iddepartamento)
)ENGINE=INNODB;

INSERT INTO Cidade values (1 ,"Marilia");
INSERT INTO Cidade values (2 ,"Vera Cruz");
INSERT INTO Cidade values (3 ,"Pompéia");
INSERT INTO Cidade values (4 ,"Garça");

INSERT INTO Departamento values (10 ,"Diretoria","(14)3433 1515", "1");
INSERT INTO Departamento values (20 ,"RH","(14)3433 1516", "1");
INSERT INTO Departamento values (30 ,"TI","(14)3492 1718", "2");
INSERT INTO Departamento values (40 ,"TI","(14)3471 1821", "4");
INSERT INTO Departamento values (50 ,"Vendas","(14)3471 1822", "4");

INSERT INTO Funcionario values (100 ,"Ana",'1980-05-15', "F", '2010-03-01', 7500.00, 10);
INSERT INTO Funcionario values (200 ,"Maria",'1978-12-13', "F", '2012-09-15', 3938.12, 10);
INSERT INTO Funcionario values (300 ,"Jose",'1997-03-08', "M", '2009-03-05', 5200.00, 20);
INSERT INTO Funcionario values (400 ,"Aparecido",'1979-06-25', "M", '2011-04-10', 7385.59, 30);
INSERT INTO Funcionario values (500 ,"Marcia",'1985-02-03', "F", '2010-03-01', 3500.00, 40);
INSERT INTO Funcionario values (600 ,"Orlando",'1983-12-25', "M", '2012-06-10', 2754.15, 20);

select * from Cidade; 

select iddepartamento, descricao, cidadeid from Departamento where descricao = "TI";

select Nome, Sexo from Funcionario where departamentoid >=20;

select Nome, Admissao from Funcionario where Admissao BETWEEN '2010-01-01' AND '2010-12-31';

select * from Funcionario where Salario > 3500.00 and Sexo = "F";

update Funcionario SET Salario =  