/* EXCLUIR REGISTROS OU SEUS DADOS*/

SELECT * FROM PRODUTOS WHERE SUBSTRING(DESCRITOR, 1, 15) = "Sabor dos Alpes";

DELETE FROM PRODUTOS WHERE CODIGO = "1001000";
DELETE FROM PRODUTOS WHERE TAMANHO = "1 Litro" AND SUBSTRING(DESCRITOR, 1, 15) = "Sabor dos Alpes";

/* deletando produtos da tabela PRODUTOS do banco vendas_sucos que não tem na tabela_de_produtos do banco sucos_vendas */
SELECT * FROM sucos_vendas.tabela_de_produtos;
SELECT CODIGO FROM PRODUTOS;

DELETE FROM PRODUTOS WHERE
CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos);
/* VERIFICAR SE AS DUAS TABELAS ESTÃO SINCRONIZADAS */
SELECT CODIGO FROM PRODUTOS WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos);	/* TEM QUE SER 0 */


/*Vamos excluir as notas fiscais (Apenas o cabeçalho) cujos clientes tenham a idade menor ou igual a 18 anos.*/
SELECT * FROM CLIENTES WHERE IDADE <= 18;
SELECT * FROM NOTAS;

SELECT COUNT(B.CPF) FROM CLIENTES A
INNER JOIN NOTAS B
ON A.CPF = B.CPF AND A.IDADE <= 18;	/* DETECTOU 12466 REGISTROS */

/* primeiro jeito */
DELETE FROM NOTAS WHERE CPF IN (SELECT CPF FROM CLIENTES
WHERE IDADE <= 18);					/* DELETOU 12466 REGISTROS */

/* segundo jeito */
DELETE A
FROM NOTAS A
INNER JOIN CLIENTES B ON A.CPF = B.CPF
WHERE B.IDADE <= 18;

/* terceiro jeito: é igual ao segundo, mas serve para demonstrar o uso do ALIAS entre o DELETE e o FROM */
DELETE NOTAS
FROM NOTAS
INNER JOIN CLIENTES ON NOTAS.CPF = CLIENTES.CPF
WHERE IDADE <= 18;
