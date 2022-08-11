/* SUBCONSULTAS */

USE sucos_vendas;

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;	/*Tijuca, Jardins, Copacana, Santo Amaro*/
SELECT * FROM tabela_de_clientes WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

/*
SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000
*/

SELECT rnotas.CPF, rnotas.TOTAL_NOTAS FROM (SELECT CPF, COUNT(*) AS TOTAL_NOTAS
FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) rnotas
WHERE TOTAL_NOTAS > 2000;