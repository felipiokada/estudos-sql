/* USANDO O SELECT */
/* No MySQL o comando TOP é o LIMIT */

SELECT * FROM sucos_vendas.tabela_de_clientes LIMIT 2,3; /*Informa que pegará 3 registros a partir da terceira posicão, pois ele considera o primeiro elemento o 0*/
SELECT * FROM sucos_vendas.notas_fiscais WHERE DATA_VENDA = '2017-01-01' LIMIT 10;

SELECT * FROM sucos_vendas.itens_notas_fiscais WHERE PRECO > 10;
SELECT * FROM sucos_vendas.itens_notas_fiscais WHERE PRECO > 10;
SELECT * FROM tbproduto WHERE QUANTIDADE_DE_UNIDADES <> 10; /*selecione todos os registros que sejam tenham qnt. de unidades diferentes de 10*/
SELECT * FROM tbproduto WHERE PRECO_LISTA > 20 AND PRECO_LISTA < 19;
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 10 AND 11;
SELECT * FROM tbproduto WHERE EMBALAGEM='LATA';
SELECT * FROM tbcliente WHERE NOME > "Rafa";

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO < '1990-05-13';
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) >= 1997;
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) BETWEEN 1994 AND 2002;
SELECT * FROM tbcliente WHERE MONTH(DATA_NASCIMENTO) BETWEEN 10 AND 20;
SELECT * FROM tbcliente WHERE DAY(DATA_NASCIMENTO) >= 15;

SELECT * FROM tbcliente WHERE IDADE > 23 and SEXO = 'F';
SELECT * FROM tbcliente WHERE BAIRRO = 'Jardins' OR BAIRRO = 'Cidade Nova';
SELECT * FROM tbcliente WHERE (BAIRRO = 'Jardins' AND IDADE > 30) OR (CIDADE = 'Rio de Janeiro');

SELECT DISTINCT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro'; /* DISTINCT mostrará valores em coordenadas cartesianas */
SELECT * FROM tbcliente WHERE NOME LIKE '%Pedro%';  /*<-- tem Pedro*/
SELECT * FROM tbcliente WHERE NOME LIKE 'João%';    /*<-- começam com João*/
SELECT * FROM tbcliente WHERE NOME LIKE '%João';    /*<-- terminam com João*/

SELECT MIN(QUANTIDADE_DE_UNIDADES) AS MENOR_QUANTIDADE FROM tbproduto;
SELECT MAX(QUANTIDADE_DE_UNIDADES) AS MAIOR_QUANTIDADE FROM tbproduto;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO, PRECO_DE_LISTA;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC, PRECO_DE_LISTA;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC, PRECO_DE_LISTA DESC;
SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE '%Linha Refrescante%' ORDER BY PRECO_DE_LISTA;

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE '%Linha Refrescante - 1 Litro - Morango/Limão%'; /*OU*/
SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limão';
SELECT * FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ORDER BY QUANTIDADE DESC;
