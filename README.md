# estudos-sql
Estudos sobre SQL

CONTEÚDO RESUMIDO E COM FINS DE CONSULTA.
ESTÁ DESORGANIZADO. AO FINAL CONCLUSIVO DOS MEUS ESTUDOS PARCIAIS SOBRE SQL UTILIZANDO MYSQL, ORGANIZAREI A PASTA COM
O CONTEÚDO SEPARANDO EM ARQUIVOS SQL.

TABELA - PROCEDURES - TRIGGERS - VIEW

SELECT * FROM tabela_de_clientes LIMIT 2,3; /*Informa que pegará 3 registros a partir da terceira posicão, pois ele considera o primeiro elemento o 0*/
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '2017-01-01' LIMIT 10;

DELETE FROM tbprodutos WHERE id='0000000000000001';
DELETE FROM tbproduto WHERE PRECO_LISTA BETWEEN 10 AND 12;

ALTER TABLE tbproduto ADD COLUMN DATA_REGISTRO DATETIME;
ALTER TABLE tbproduto ADD PRIMARY KEY (ID);

UPDATE tbproduto SET NOME='suco' WHERE id='00000000000002';

HAVING (select depois dos resultados do group by)
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM tabela_de_clientes GROUP BY ESTADO;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM tabela_de_clientes GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 820000;

SELECT ESTADO, MAX(LIMITE_DE_CREDITO), MIN(LIMITE_DE_CREDITO) FROM tabela_de_clientes GROUP BY ESTADO
HAVING MAX(LIMITE_DE_CREDITO) > 180000;

SELECT ESTADO, MAX(LIMITE_DE_CREDITO), MIN(LIMITE_DE_CREDITO) FROM tabela_de_clientes GROUP BY ESTADO
HAVING MAX(LIMITE_DE_CREDITO) < 180000 AND MIN(LIMITE_DE_CREDITO) > 50000;

/*Quais foram os clientes que fizeram mais de 2000 compras em 2016?*/
SELECT * FROM notas_fiscais;
SELECT COUNT(*) AS 'TOTAL DE COMPRAS' FROM notas_fiscais;
SELECT CPF, COUNT(*) AS 'TOTAL DE COMPRAS' FROM notas_fiscais GROUP BY CPF;

SELECT CPF, COUNT(*) AS 'TOTAL DE COMPRAS' FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF
HAVING COUNT(*) > 2000;

/*CASE - WHEN ... THEN ... - ELSE - END*/
SELECT * FROM tabela_de_produtos;
SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos;
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) FROM tabela_de_produtos GROUP BY EMBALAGEM; /*MEDIA DO PRECO DE CADA EMBALAGEM*/

SELECT EMBALAGEM,
CASE
  WHEN PRECO_DE_LISTA >= 12 THEN 'CARO'
  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'NORMAL'
ELSE 'BARATO'
END AS STATUS_COMPRA
FROM tabela_de_produtos;

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA),
CASE
  WHEN PRECO_DE_LISTA >= 12 THEN 'CARO'
  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'NORMAL'
ELSE 'BARATO'
END AS STATUS_COMPRA
FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA),
CASE
  WHEN PRECO_DE_LISTA >= 12 THEN 'CARO'
  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'NORMAL'
ELSE 'BARATO'
END AS STATUS_COMPRA
FROM tabela_de_produtos
GROUP BY EMBALAGEM,
CASE
  WHEN PRECO_DE_LISTA >= 12 THEN 'CARO'
  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'NORMAL'
ELSE 'BARATO'
END;

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA),
CASE
  WHEN PRECO_DE_LISTA >= 12 THEN 'CARO'
  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'NORMAL'
ELSE 'BARATO'
END AS STATUS_COMPRA
FROM tabela_de_produtos
GROUP BY EMBALAGEM,
CASE
  WHEN PRECO_DE_LISTA >= 12 THEN 'CARO'
  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'NORMAL'
ELSE 'BARATO'
END
ORDER BY EMBALAGEM;


/*Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, nascidos entre 1990 e 
1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação.*/

SELECT NOME, DATA_DE_NASCIMENTO, 
CASE
	WHEN YEAR(DATA_DE_NASCIMENTO) < 1990 THEN 'VELHO'
    WHEN YEAR(DATA_DE_NASCIMENTO) >= 1990 AND YEAR(DATA_DE_NASCIMENTO) <= 1995 THEN 'JOVEM'
    ELSE 'CRIANÇA'
END CLASSIFICAÇÃO_IDADE
FROM tabela_de_clientes;

----------JOIN-----------

SELECT * FROM tabela_de_vendedores VENDEDORES
INNER JOIN notas_fiscais NOTAS_FISCAIS
ON NOTAS_FISCAIS.MATRICULA = VENDEDORES.MATRICULA;

/*TEMOS QUE COLOCAR O A.MATRICULA, PORQUE O SQL NÃO SABERÁ SE A MATRICULA É DA TABELA DOS VENDEDORES OU DAS NOTAS FISCAIS*/
SELECT A.MATRICULA, NOME FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA;

SELECT A.MATRICULA, NOME, COUNT(*) AS 'MAX NOTAS' FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY MATRICULA;

SELECT A.MATRICULA, NOME, COUNT(*) AS 'MAX NOTAS' FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY NOME
ORDER BY 'MAX NOTAS';

/*OUTROS COMANDOS QUE SUBSTITUE INNER JOIN: RIGHT JOIN, LEFT JOIN, FULL JOIN*/
/*SELECT * FROM A.tabela1, B.tabela2 ==> gera uma matriz cartesiana, combinando cada elemento da tabela1 com a tabela2*/

/*Obtenha o faturamento anual da empresa.
Leve em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.*/

/*PRIMEIRO PASSO: IDENTIFICAR AS TABELAS NECESSÁRIAS PARA ISSO*/
SELECT * FROM notas_fiscais;
SELECT * FROM itens_notas_fiscais;

/*SEGUNDO PASSO: LISTAR ORGANIZADAMENTE O QUE ESTÁ SENDO FILTRADO*/
SELECT CPF, YEAR(DATA_VENDA) AS ANO, B.*, QUANTIDADE*PRECO AS FATURAMENTO FROM notas_fiscais A
INNER JOIN itens_notas_fiscais B
ON A.NUMERO = B.NUMERO;

/*TERCEIRO PASSO: FILTRAR O QUE FOI PEDIDO*/
SELECT YEAR(DATA_VENDA) AS ANO, SUM(QUANTIDADE*PRECO) AS FATURAMENTO FROM notas_fiscais nf
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

/*RIGHT JOIN E LEFT JOIN*/
SELECT CPF, COUNT(*) FROM tabela_de_clientes GROUP BY CPF;
SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;

SELECT A.CPF, A.NOME, COUNT(*) FROM tabela_de_clientes A
INNER JOIN notas_fiscais B
ON A.CPF = B.CPF
GROUP BY A.CPF;

/*Como o COUNT(*) conta direitinho a quantidade exata de registros? porque ele realiza a contagem depois das tabelas se unirem
POR ISSO que contou Fábio Carvalho = 1*/
SELECT A.CPF, A.NOME, COUNT(*) FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B
ON A.CPF = B.CPF
GROUP BY A.CPF;

SELECT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B
ON A.CPF = B.CPF
GROUP BY A.CPF;

SELECT A.CPF, B.NOME, B.CPF FROM notas_fiscais A
RIGHT JOIN tabela_de_clientes B
ON A.CPF = B.CPF
GROUP BY A.CPF;

SELECT A.CPF, B.NOME, B.CPF FROM notas_fiscais A
RIGHT JOIN tabela_de_clientes B
ON A.CPF = B.CPF
WHERE A.CPF IS NULL
GROUP BY A.CPF;

--MOSTRANDO O CROSSJOIN--

SELECT NOME, BAIRRO FROM tabela_de_vendedores;
SELECT BAIRRO, COUNT(*) FROM tabela_de_vendedores GROUP BY BAIRRO;	/*Tijuca, Jardins, Copacabana, Santo Amaro*/
SELECT BAIRRO, COUNT(*) FROM tabela_de_clientes GROUP BY BAIRRO;	/*3 = Jardins, Tijuca, o resto é 1, não tem Copacabana*/

SELECT tabela_de_vendedores.NOME,
tabela_de_vendedores.BAIRRO,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM tabela_de_vendedores INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
ORDER BY tabela_de_vendedores.BAIRRO;	/*Aparecerá 7 (3 de Jardins, 3 da Tijuca e 1 de Santo Amaro)*/

SELECT COUNT(BAIRRO) FROM tabela_de_clientes;	/*15*/
SELECT COUNT(BAIRRO) FROM tabela_de_vendedores;	/*4*/
SELECT BAIRRO FROM tabela_de_clientes;
SELECT BAIRRO FROM tabela_de_vendedores;

/*CROSS JOIN*/
SELECT tabela_de_clientes.BAIRRO, tabela_de_vendedores.BAIRRO FROM tabela_de_clientes, tabela_de_vendedores;	
SELECT COUNT(*) FROM tabela_de_clientes, tabela_de_vendedores;	/*60*/


