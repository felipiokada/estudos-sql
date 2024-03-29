/* Pedido do gerente da área de vendas: um relatório de vendas válidas e vendas inválidas
	Cada cliente tem um volume máximo de compra por mês (itens_notas_fiscais e tabela_de_clientes)
*/

/* 1 PASSO: listar as tabelas que serão necessárias para esse pedido */
SELECT * FROM tabela_de_clientes;
SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;
SELECT COUNT(DISTINCT CPF) FROM notas_fiscais;	/* 14 registros */

/* 2 PASSO: visualizar a junção das tabelas */
SELECT NF.CPF, DATA_VENDA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM
itens_notas_fiscais INF INNER JOIN
notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
GROUP BY NF.CPF, YEAR(DATA_VENDA);		/* 56 registros (14 x 4 de cada ano [2015, 2016, 2017, 2018])*/

SELECT NF.CPF, DATA_VENDA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM
itens_notas_fiscais INF INNER JOIN
notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
GROUP BY NF.CPF, YEAR(DATA_VENDA), MONTH(DATA_VENDA);

/* SUBCONSULTA PARA VERIFICAR O RESULTADO DA QUANTIDADE DE REGISTROS DOS ÚLTIMOS 2 COMANDOS DE CIMA */
SELECT COUNT(*) FROM (SELECT NF.CPF, DATA_VENDA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM
itens_notas_fiscais INF INNER JOIN
notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
GROUP BY NF.CPF, YEAR(DATA_VENDA)) resultado;	/*COUNT(*) = 56*/

SELECT COUNT(*) FROM (SELECT NF.CPF, DATA_VENDA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM
itens_notas_fiscais INF INNER JOIN
notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
GROUP BY NF.CPF, YEAR(DATA_VENDA), MONTH(DATA_VENDA)) resultado;	/* 546 registros, porque 2018 tem 42 registros */

/* 3 PASSO: formatar data_venda para ano/mês;
			colocar se a venda foi válida ou não usando CASE - WHEN - THEN - END
            ORDER BY em Nome e data*/
SELECT TC.NOME, NF.CPF, DATE_FORMAT(DATA_VENDA, '%Y/%m') AS DATA_VENDA, TC.VOLUME_DE_COMPRA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
CASE
	WHEN VOLUME_DE_COMPRA >= SUM(INF.QUANTIDADE) THEN 'VÁLIDA'
    ELSE 'INVÁLIDA'
END AS STATUS_VENDA
FROM itens_notas_fiscais INF INNER JOIN
notas_fiscais NF INNER JOIN
tabela_de_clientes TC
ON INF.NUMERO = NF.NUMERO AND TC.CPF = NF.CPF
GROUP BY NF.CPF, YEAR(DATA_VENDA), MONTH(DATA_VENDA)
ORDER BY TC.NOME, DATA_VENDA;

/* 4 PASSO: criar uma view para facilitar a visualização do gerente */
CREATE OR REPLACE VIEW `VW_STATUS_DE_VENDA_MENSAL_DE_CADA_CLIENTE` AS
SELECT TC.NOME, NF.CPF, DATE_FORMAT(DATA_VENDA, '%Y/%m') AS DATA_VENDA, TC.VOLUME_DE_COMPRA, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
CASE
	WHEN VOLUME_DE_COMPRA >= SUM(INF.QUANTIDADE) THEN 'VÁLIDA'
    ELSE 'INVÁLIDA'
END AS STATUS_VENDA
FROM itens_notas_fiscais INF INNER JOIN
notas_fiscais NF INNER JOIN
tabela_de_clientes TC
ON INF.NUMERO = NF.NUMERO AND TC.CPF = NF.CPF
GROUP BY NF.CPF, YEAR(DATA_VENDA), MONTH(DATA_VENDA)
ORDER BY TC.NOME, DATA_VENDA;

/* Complemente este relatório listando somente os que tiveram vendas inválidas e
calculando a diferença entre o limite de venda máximo e o realizado, em percentuais.*/
SELECT *, ROUND((QUANTIDADE_VENDAS / VOLUME_DE_COMPRA - 1) * 100, 2) AS PERCENTUAL_DE_DIFERENÇA
FROM vw_status_de_venda_mensal_de_cada_cliente
WHERE STATUS_VENDA = 'INVÁLIDA';

SELECT *, ROUND((1 - VOLUME_DE_COMPRA / QUANTIDADE_VENDAS) * 100, 2) AS PERCENTUAL_DE_DIFERENÇA
FROM vw_status_de_venda_mensal_de_cada_cliente
WHERE QUANTIDADE_VENDAS > VOLUME_DE_COMPRA;


/* RESOLUÇÃO DO ORIENTADOR */
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;
