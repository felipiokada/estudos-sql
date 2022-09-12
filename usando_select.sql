/* USANDO O SELECT */
/* No MySQL o comando TOP é o LIMIT */

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

SELECT DISTINCT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';
SELECT * FROM tbcliente WHERE NOME LIKE '%Pedro%';  /*<-- tem Pedro*/
SELECT * FROM tbcliente WHERE NOME LIKE 'João%';    /*<-- começam com João*/
SELECT * FROM tbcliente WHERE NOME LIKE '%João';    /*<-- terminam com João*/

SELECT MIN(QUANTIDADE_DE_UNIDADES) AS MENOR_QUANTIDADE FROM tbproduto;
SELECT MAX(QUANTIDADE_DE_UNIDADES) AS MAIOR_QUANTIDADE FROM tbproduto;
