SELECT * 
  FROM estado RIGHT OUTER JOIN cidade
    ON (cidade.uf = estado.uf);
    
    
 SELECT MAX(valor_unitario) Maximo,
        MIN(valor_unitario) Minimo,
        AVG(valor_unitario) Media,
        SUM(valor_unitario) Soma,
        COUNT(valor_unitario) 'Quantidade de Linhas'
   FROM produto;   
   
SELECT * FROM produto;

CREATE TABLE grupo (
idgrupo INT UNSIGNED NOT NULL AUTO_INCREMENT,
descricao VARCHAR(30) NOT NULL,
CONSTRAINT PK_Grupo PRIMARY KEY(idgrupo)
) ENGINE=INNODB;   

INSERT INTO grupo (descricao) VALUES ('Material Escritório');
INSERT INTO grupo (descricao) VALUES ('Material Limpeza');
INSERT INTO grupo (descricao) VALUES ('Informática');

SELECT * FROM grupo;

ALTER TABLE produto ADD COLUMN idgrupo INT UNSIGNED;
ALTER TABLE produto ADD CONSTRAINT FK_produto_grupo
FOREIGN KEY(idgrupo) REFERENCES grupo(idgrupo);

DESC produto;
UPDATE produto SET idgrupo = 1;

SELECT * FROM produto;

INSERT INTO produto (descricao, valor_unitario,idgrupo)
VALUES('Detergente',7,2);
INSERT INTO produto (descricao, valor_unitario,idgrupo)
VALUES('Sabão em pó',20,2);
INSERT INTO produto (descricao, valor_unitario,idgrupo)
VALUES('Sabonete',3,2);

INSERT INTO produto (descricao, valor_unitario,idgrupo)
VALUES('Monitor de Vídeo 22"',879,3);
INSERT INTO produto (descricao, valor_unitario,idgrupo)
VALUES('SSD 480 GB',299,3);


SELECT * 
  FROM produto
  JOIN grupo
    ON (produto.idgrupo = grupo.idgrupo);


SELECT produto.idgrupo, grupo.descricao, 
       MAX(valor_unitario) Maximo,
       MIN(valor_unitario) Minimo,
       AVG(valor_unitario) Media,
       SUM(valor_unitario) Soma,
       COUNT(valor_unitario) 'Quantidade de Linhas'
  FROM produto
  JOIN grupo
    ON (produto.idgrupo = grupo.idgrupo)
  GROUP BY produto.idgrupo, grupo.descricao;
  

SELECT * FROM cliente;

SELECT nome, CONCAT(numero, ' ',complemento)
 FROM cliente; 
  
SELECT nome, UPPER(nome), LOWER(nome)
 FROM cliente; 
  
SELECT nome, REPLACE(nome,'a','9')
 FROM cliente; 
 
SELECT nome, SUBSTR(nome,1,3), SUBSTR(nome,2,3)
  FROM cliente; 
  
  
SELECT nome, INSTR(nome,'a')
  FROM cliente;
  
  
SELECT nome, LENGTH(nome)
  FROM cliente;
  
SELECT MAX(nome), 
       MIN(nome), 
		 COUNT(nome), 
		 AVG(nome), 
		 SUM(nome)
  FROM cliente;    
  
SELECT MAX(data), 
       MIN(data), 
		 COUNT(data), 
		 AVG(data), 
		 SUM(data)
  FROM nfe;   
  
  SELECT NOW(), CURDATE(),
         LAST_DAY(CURDATE()),
			LAST_DAY('2024-02-01'),
			DAY('2024-12-11') Dia,
			MONTH('2024-12-11') Mes,
			YEAR('2024-12-11') Ano,
			DATEDIFF('2023-06-30',CURDATE()),
			DATEDIFF(CURDATE(),'2003-04-12')/365;
			
SELECT TRUNCATE((DATEDIFF(CURDATE(),'2003-04-12')/365.25),0);			
SELECT TRUNCATE((DATEDIFF('2023-08-10','1970-08-11')/365.25),0);			
         
  