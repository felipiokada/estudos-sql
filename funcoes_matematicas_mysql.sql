/* FUNÇÕES MATEMÁTICAS */

/*ROUND - SQRT -   */

SELECT (20 + (40 - 13)/13) AS RESULTADO;
SELECT CEILING(42.4454532345) AS RESULTADO;
SELECT ROUND(563.909999999324) AS RESULTADO;
SELECT ROUND(563.42323299999) AS RESULTADO;
SELECT FLOOR(42.4454532345) AS RESULTADO;

SELECT RAND() AS RESULTADO;

SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM itens_notas_fiscais;
