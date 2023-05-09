SELECT * FROM estado;
SELECT * FROM cidade;

/* CROSS JOIN */
SELECT *
  FROM cidade
  JOIN estado;
  
/* EQUI JOIN */
SELECT * 
  FROM cidade
  JOIN estado
    ON (cidade.uf = estado.uf);  
    
SELECT cidade.*, estado.nome AS estado 
  FROM cidade
  JOIN estado
    ON (cidade.uf = estado.uf);  
	 
SELECT cidade.*, estado.nome AS estado 
  FROM cidade
  JOIN estado
    ON (cidade.uf = estado.uf);  
	 
SELECT c.*, e.nome AS estado 
  FROM cidade c
  JOIN estado e
    ON (c.uf = e.uf);  	 	   
    
SELECT cidade.*, estado.nome AS estado 
  FROM cidade
 NATURAL JOIN estado;
 
 
SELECT cidade.*, estado.nome AS estado 
  FROM cidade
  JOIN estado
    ON (cidade.uf = estado.uf
	    AND cidade.nome = estado.nome);
		 
SELECT bairro.*, cidade.*		   
  FROM bairro
  JOIN cidade
    ON (bairro.idcidade = cidade.idcidade);


 SELECT bairro.*, cidade.*		   
   FROM bairro
NATURAL JOIN cidade
  WHERE nome = 'Marília';
    
SELECT bairro.*, cidade.*		   
  FROM bairro
  JOIN cidade
    ON (bairro.idcidade = cidade.idcidade)
 ORDER BY cidade.nome,bairro.descricao;


ALTER TABLE bairro ADD COLUMN nome VARCHAR(60) DEFAULT ' ';   

 SELECT bairro.*, cidade.*		   
   FROM bairro
NATURAL JOIN cidade;


/* INNER JOIN com 3(três) tabelas */
SELECT b.descricao, 
       c.nome cidade, 
		 e.nome estado
  FROM bairro b
  JOIN cidade c
    ON (b.idcidade = c.idcidade)
  JOIN estado e
    ON (c.uf = e.uf);  

SELECT b.descricao, 
       c.nome cidade, 
		 e.nome estado
  FROM bairro b
  JOIN cidade c
    ON (b.idcidade = c.idcidade)
  JOIN estado e
    ON (c.uf = e.uf)	 ;  
    
SELECT * FROM estado;

SELECT b.descricao, 
       c.nome cidade, 
		 e.nome estado
  FROM estado e
  JOIN cidade c
    ON (c.uf = e.uf)	 
  JOIN bairro b  
    ON (b.idcidade = c.idcidade);   
	 

SELECT * 
  FROM cidade
  JOIN estado
    ON (cidade.uf = estado.uf);	    
    
SELECT * 
  FROM cidade
  LEFT OUTER JOIN estado
    ON (cidade.uf = estado.uf);    
    
SELECT * 
  FROM cidade
  RIGHT OUTER JOIN estado
    ON (cidade.uf = estado.uf);   
	 

ALTER TABLE cliente MODIFY cep INT UNSIGNED NULL;
DESC cliente;

INSERT INTO cliente (nome,cadastro,numero)
VALUE ('Aluno', '2023-04-17', '07');

SELECT * FROM cliente;

SELECT * 
  FROM cliente
  LEFT JOIN ceps
    ON (ceps.cep = cliente.cep);


INSERT INTO ceps VALUE (17512752,'Av Sigismundo Nunes de Oliveira', NULL,200);    
SELECT * 
  FROM cliente
  RIGHT JOIN ceps
    ON (ceps.cep = cliente.cep);  
    
SELECT * 
  FROM cliente
  LEFT JOIN ceps
    ON (ceps.cep = cliente.cep)
UNION
SELECT * 
  FROM cliente
  RIGHT JOIN ceps
    ON (ceps.cep = cliente.cep);	     
	 
	 
SELECT * FROM estado;	 
	   