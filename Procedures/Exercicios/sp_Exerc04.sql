/* Exercício 4 */
/* Crie uma variável chamada NUMNOTAS e atribua a ela o número de notas fiscais
do dia 01/01/2017. Mostre na saída do script o valor da variável. */

USE sucos_vendas;
DROP PROCEDURE IF EXISTS sp_Exerc04_Numero_de_Notas$$

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE sp_Exerc04_Numero_de_Notas()
BEGIN
	DECLARE NUMNOTAS INT;
	SELECT COUNT(*) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = '01/01/2017';
    SELECT NUMNOTAS;
END$$
DELIMITER ;
