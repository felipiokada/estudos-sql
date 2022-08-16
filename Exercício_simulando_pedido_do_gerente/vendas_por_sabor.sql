/* Relatório de vendas por sabor
	Pedido: Crie um relatório a pedido da área comercial da
        empresa de sucos de frutas. A solicitação é um acompanhamento sobre as
        vendas do ano de 2016 por sabores e eles gostariam de ver as informações
        no seguinte modelo:
        Na primeira coluna, são apresentados os sabores dos sucos. Na segunda, o
        ano analisado (2016). Na terceira coluna, temos a quantidade vendida no
        ano todo. Os dados devem ser ordenados do maior para o menor
        em relação a esta coluna. E, por fim, temos o percentual de participação
        comparado ao total de vendas.
 */

/* 1 PASSO: IDENTIFICAR A EXIGÊNCIA DO GERENTE */
SELECT * FROM tabela_de_produtos;		/* TEM O SABOR */
SELECT * FROM itens_notas_fiscais;		/* TEM QUANTIDADE, TEM O CODIGO_DO_PRODUTO DA tabela_de_produtos E NUMERO PARA A notas_fiscais*/
SELECT * FROM notas_fiscais;			/* DATA_VENDA */
SELECT SABOR, YEAR(DATA_VENDA) AS ANO, QUANTIDADE_VENDA, PARTICIPACAO;

/* 2 PASSO: JUNTAR AS TABELAS */

/* 2.1 : juntando tabela de produtos com itens notas fiscais e somando a quantidade total por sabor*/
SELECT SABOR, TP.CODIGO_DO_PRODUTO, INF.CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE_VENDA, NUMERO FROM
tabela_de_produtos TP INNER JOIN
itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
GROUP BY SABOR;

/* 2.2 : juntando com a tabela de notas fiscais*/
SELECT SABOR, TP.CODIGO_DO_PRODUTO, INF.CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE_VENDA, INF.NUMERO, NF.NUMERO FROM
tabela_de_produtos TP INNER JOIN
itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN
notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
GROUP BY SABOR;

/* 3 PASSO: retirando informações guias(NUMERO, CODIGO_DO_PRODUTO)
			filtrando por data
            ordenando pela quantidade de vendas do maior para o menor (decrescente)
            adicionando percentual de vendas. Nome do campo: Participação (em percentual)*/

SELECT SABOR, DATE_FORMAT(DATA_VENDA, '%Y') AS ANO, SUM(QUANTIDADE) AS QUANTIDADE_VENDIDA,
ROUND((SUM(QUANTIDADE) / (
	SELECT SUM(QUANTIDADE) FROM tabela_de_produtos TP INNER JOIN itens_notas_fiscais INF
	ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
	INNER JOIN notas_fiscais NF
	ON INF.NUMERO = NF.NUMERO
    WHERE YEAR(DATA_VENDA) = 2016)) * 100, 2) AS PARTICIPACAO
FROM tabela_de_produtos TP INNER JOIN itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY SABOR
ORDER BY QUANTIDADE_VENDIDA DESC;

/* 4 PASSO: gerar VIEW para o gerente*/
CREATE OR REPLACE VIEW `VW_sabor_2016_quantidade_vendida_e_percentual` AS 
SELECT SABOR, DATE_FORMAT(DATA_VENDA, '%Y') AS ANO, SUM(QUANTIDADE) AS QUANTIDADE_VENDIDA,
ROUND((SUM(QUANTIDADE) / (
	SELECT SUM(QUANTIDADE) FROM tabela_de_produtos TP INNER JOIN itens_notas_fiscais INF
	ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
	INNER JOIN notas_fiscais NF
	ON INF.NUMERO = NF.NUMERO
    WHERE YEAR(DATA_VENDA) = 2016)) * 100, 2) AS PARTICIPACAO
FROM tabela_de_produtos TP INNER JOIN itens_notas_fiscais INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF
ON INF.NUMERO = NF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY SABOR
ORDER BY QUANTIDADE_VENDIDA DESC;

SELECT * FROM vw_sabor_2016_quantidade_vendida_e_percentual;

/* CÓDIGO ABAIXO DESENVOLVIDO PELO ORIENTADOR */
/* Outra forma de gerar o mesmo relatório */

/*
SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
ROUND((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_SABOR.QUANTIDADE DESC;
*/
