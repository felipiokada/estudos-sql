# estudos-sql
Estudos sobre SQL

MYSQL Workbench

TABELA - PROCEDURES - TRIGGERS - VIEW

SELECT * FROM CIDADE -> Seleciona TODOS os campos da tabela CIDADE

SELECT NOME, ID, PRECO FROM tbproduto;
SELECT NOME AS NOME_PRODUTO, PRECO AS PRECO_PRODUTO FROM tbproduto;
SELECT NOME, ID FROM tbproduto LIMIT 5;
SELECT * FROM tbproduto WHERE EMBALAGEM='LATA';

CREATE {DATABASE or SCHEMA} "nome da tabela"    <-- CRIA
DROP {DATABASE or SCHEMA} "nome da tabela"      <-- DELETA (cuidado)

AUTO_IMCREMENT
DATETIME

DELETE FROM tbprodutos WHERE id='0000000000000001';
DELETE FROM tbproduto WHERE PRECO_LISTA BETWEEN 10 AND 12;

ALTER TABLE tbproduto ADD COLUMN DATA_REGISTRO DATETIME;
ALTER TABLE tbproduto ADD PRIMARY KEY (ID);

SELECT * FROM tbproduto WHERE QUANTIDADE_DE_UNIDADES > 10;
SELECT TOP 2 * FROM tbproduto WHERE QUANTIDADE_DE_UNIDADES > 4;
SELECT * FROM tbproduto WHERE QUANTIDADE_DE_UNIDADES <> 10; /*selecione todos os registros que sejam tenham qnt. de unidades diferentes de 10*/
SELECT * FROM tbproduto WHERE PRECO_LISTA > 20 AND PRECO_LISTA < 19;
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 10 AND 11;
SELECT * FROM tbcliente WHERE NOME > "Rafa";

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO < '1990-05-13';
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) >= 1997;
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) BETWEEN 1994 AND 2002;
SELECT * FROM tbcliente WHERE MONTH(DATA_NASCIMENTO) BETWEEN 10 AND 20;
SELECT * FROM tbcliente WHERE DAY(DATA_NASCIMENTO) >= 15;

SELECT * FROM tbcliente WHERE IDADE > 23 and SEXO = 'F';
SELECT * FROM tbcliente WHERE BAIRRO = 'Jardins' OR BAIRRO = 'Cidade Nova';
SELECT * FROM tbcliente WHERE (BAIRRO = 'Jardins' AND IDADE > 30) OR (CIDADE = 'Rio de Janeiro');

SELECT DINSTINCT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';
SELECT * FROM tbcliente WHERE NOME LIKE '%Pedro%';  <-- tem Pedro
SELECT * FROM tbcliente WHERE NOME LIKE 'João%';    <-- começam com João
SELECT * FROM tbcliente WHERE NOME LIKE '%João';    <-- terminam com João

SELECT TOP 60 PERCENT * FROM tbproduto;
SELECT MIN(QUANTIDADE_DE_UNIDADES) AS MENOR_QUANTIDADE FROM tbproduto;
SELECT MAX(QUANTIDADE_DE_UNIDADES) AS MAIOR_QUANTIDADE FROM tbproduto;

UPDATE tbproduto SET NOME='suco' WHERE id='00000000000002';

INSERT INTO tbproduto(ID, NOME, EMBALAGEM, QUANTIDADE_DE_UNIDADES, VOLUME, DATA_REGISTRO)
VALUES('00001', 'SUCO', 'LATA', 3, '300ml', '2017-10-08');

CREATE TABLE tbproduto(
ID VARCHAR(11),
NOME VARCHAR(100),
EMBALAGEM (50),
QUANTIDADE_DE_UNIDADE INT,
VOLUME VARCHAR(40),
DATA_REGISTRO DATETIME);

