-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDEx07a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDEx07a` DEFAULT CHARACTER SET utf8 ;
USE `BDEx07a` ;


/*2 - Tomando como parâmetros o DED que foi concebido escreva o(s) DDL(s) para criar a(s) tabela(s).*/
-- -----------------------------------------------------
-- Table `BDEx07a`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDEx07a`.`telefone` (
  `ID` INT NOT NULL,
  `Telefone1` VARCHAR(20) NOT NULL,
  `Telefone2` VARCHAR(20) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDEx07a`.`Almoxarifado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDEx07a`.`Almoxarifado` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(255) NULL,
  `telefoneID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Almoxarifado_telefone_idx` (`telefoneID` ASC) VISIBLE,
  CONSTRAINT `fk_Almoxarifado_telefone`
    FOREIGN KEY (`telefoneID`)
    REFERENCES `BDEx07a`.`telefone` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDEx07a`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDEx07a`.`Produto` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(255) NULL,
  `Grupo` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDEx07a`.`Almoxarifado_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDEx07a`.`Almoxarifado_Produto` (
  `ProdutoID` INT NOT NULL,
  `AlmoxarifadoID` INT NOT NULL,
  `DataCadastro` DATE NULL,
  `Quantidade` INT NULL,
  `ValorUnitario` DECIMAL(10,2) NULL,
  PRIMARY KEY (`ProdutoID`, `AlmoxarifadoID`),
  INDEX `fk_Produto_has_Almoxarifado_Almoxarifado1_idx` (`AlmoxarifadoID` ASC) VISIBLE,
  INDEX `fk_Produto_has_Almoxarifado_Produto1_idx` (`ProdutoID` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Almoxarifado_Produto1`
    FOREIGN KEY (`ProdutoID`)
    REFERENCES `BDEx07a`.`Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Almoxarifado_Almoxarifado1`
    FOREIGN KEY (`AlmoxarifadoID`)
    REFERENCES `BDEx07a`.`Almoxarifado` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



/*3 - Escreva os DMLs para inserir os dados listados na(s) tabela(s) criada(s).*/
-- Inserção na tabela Telefone
INSERT INTO Telefone (ID, Telefone1, Telefone2)
VALUES (1, '3433 1519', '3433 1520');

INSERT INTO Telefone (ID, Telefone1, Telefone2)
VALUES (2, '34331216', NULL);

INSERT INTO Telefone (ID, Telefone1, Telefone2)
VALUES (3 ,'3433 1720', NULL);

-- Inserção na tabela Almoxarifado
INSERT INTO Almoxarifado (ID, Nome, TelefoneID)
VALUES (1, 'Matriz', 1);

INSERT INTO Almoxarifado (ID, Nome, TelefoneID)
VALUES (2, 'Filial 01', 2);

INSERT INTO Almoxarifado (ID, Nome, TelefoneID)
VALUES (3, 'Filial 02', 3);

-- Inserção na tabela Produto
INSERT INTO Produto (ID, Nome, Grupo)
VALUES (1, 'Detergente', 'Limpeza');

INSERT INTO Produto (ID, Nome, Grupo)
VALUES (2, 'Papel A4', 'Escritório');

INSERT INTO Produto (ID, Nome, Grupo)
VALUES (3, 'Lápis', 'Escritório');

INSERT INTO Produto (ID, Nome, Grupo)
VALUES (4, 'Sabão Líquido', 'Limpeza');


-- Inserção na tabela Almoxarifado_Produto
INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (1, 1, '2023-01-31', 50, 2.50);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (1, 2, '2023-02-15', 5000, 0.05);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (1, 3, '2022-04-30', 100, 2.00);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (2, 1, '2020-09-05', 20, 2.00);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (2, 4, '2023-02-25', 3, 10.13);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (2, 2, '2022-03-13', 500, 0.05);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (3, 2, '2022-08-17', 100, 0.05);

INSERT INTO Almoxarifado_Produto (AlmoxarifadoID, ProdutoID, DataCadastro, Quantidade, ValorUnitario)
VALUES (3, 3, '2021-09-15', 30, 2.00);

/*4- Elabore um DQL que liste os produtos e quantidades de estoque do Almoxarifado da Matriz.*/
SELECT p.Nome AS Produto, ap.Quantidade AS Quantidade
FROM Almoxarifado_Produto ap
JOIN Produto p ON ap.ProdutoID = p.ID
JOIN Almoxarifado a ON ap.AlmoxarifadoID = a.ID
WHERE a.Nome = 'Matriz';

/*5 - Elabore um DQL que liste o nome do Almoxarifado, o Produto e valor unitário 
dos produtos cujos estoque seja maior que 30 e menor que 1.000.*/
SELECT a.Nome AS Almoxarifado, p.Nome AS Produto, ap.ValorUnitario AS ValorUnitario
FROM Almoxarifado_Produto ap
JOIN Produto p ON ap.ProdutoID = p.ID
JOIN Almoxarifado a ON ap.AlmoxarifadoID = a.ID
WHERE ap.Quantidade > 30 AND ap.Quantidade < 1000;

/*6 - Elabore um DQL que liste os produtos e sua quantidade total (de todos os almoxarifados) 
assim como seu valor total, sendo que o valor total não deve exibir casa decimais, mas deve ser o 
mais próximo possível do valor real.*/
SELECT p.Nome AS Produto, SUM(ap.Quantidade) AS QuantidadeTotal, ROUND(SUM(ap.Quantidade * ap.ValorUnitario)) AS ValorTotal
FROM Almoxarifado_Produto ap
JOIN Produto p ON ap.ProdutoID = p.ID
GROUP BY p.Nome;

/*7 - Elabore um DQL para exibir todos os produtos e seus grupos, cadastrados a mais de 180 dias*/
SELECT p.Nome AS Produto, p.Grupo
FROM Almoxarifado_Produto ap
JOIN Produto p ON ap.ProdutoID = p.ID
WHERE DATEDIFF(CURDATE(), ap.DataCadastro) > 180;

/*8 - Escreva um DML que altere a data de cadastro de todos os produtos
 do grupo denominado Limpeza para hoje.*/
UPDATE Almoxarifado_Produto
SET DataCadastro = CURDATE()
WHERE ProdutoID IN (
    SELECT ID
    FROM Produto
    WHERE Grupo = 'Limpeza'
);

/*9 - Elabore um DML que apague todos os registros referentes à produtos do Almoxarifado Filial 01.*/
DELETE FROM Almoxarifado_Produto
WHERE AlmoxarifadoID = (
    SELECT ID
    FROM Almoxarifado
    WHERE Nome = 'Filial 01'
);







