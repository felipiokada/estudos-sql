/*  FUNÇÕES:
	Elas são as que mais diferenciam entre as SQLs(Oracle, ...). As funções são dividades geralmente em 3 grupos:
    Matemática, Escalares e Data.
    Confira a documentação do MySQL para entender as principais funções -> Functions and Operator
*/

/* Alguns exemplos de funções do MySQL */

SELECT UPPER('oLá, mUndO!') AS RESULTADO;
SELECT LOWER('OLÁ, MuNDo!') AS RESULTADO;
SELECT CONCAT('Olá', ', ','mundo!') AS RESULTADO;
SELECT CONCAT(UPPER('olá'), ', ', LOWER('MUnDo')) AS `COMBINAÇÃO DE FUNÇÕES`;
SELECT LTRIM('            interessante') AS RESULTADO;
SELECT RTRIM('tirando os espaços da direita                 ') AS RESULTADO;
SELECT TRIM('      tirando os espaços dos ambos os lados         ') AS RESULTADO;
SELECT LENGTH('TAMANHO DA sTrinG') AS RESULTADO;
SELECT SUBSTRING('Gosto de estudar', 7) AS RESULTADO;
SELECT SUBSTRING('Gosto de estudar', 7, 2) AS RESULTADO;
SELECT SUBSTRING('Gosto de estudar', 7, 6) AS RESULTADO;

/* A busca da função INSTR não é sensitive case.
   Se existir a string, retorna a POSICÃO DA PRIMEIRA STRING ENCONTRADO. Caso contrário, retorna 0 */
SELECT INSTR('Gosto de estudar', 'gosto') AS RESULTADO;
SELECT INSTR('Gosto de estudar', 'gostW') AS RESULTADO;
SELECT INSTR(CPF, '1') AS RESULTADO_1 FROM tabela_de_clientes;
SELECT CPF, INSTR(CPF, '1') AS RESULTADO_1, INSTR(CPF, '8') AS RESULTADO_8 FROM tabela_de_clientes;

SELECT CONCAT(NOME, ' - CPF: ', CPF) AS `NOME E CPF` FROM tabela_de_clientes;
