/* STORED PROCEDURES */
/* As linguagens estruturadas não têm padrão com outro banco de dado como Oracle, SQL Serve e etc */

USE `sucos_vendas`;
DROP PROCEDURE IF EXISTS `Teste_Criacao_Procedure_1`;
DROP PROCEDURE IF EXISTS `Teste_Criacao_Procedure_2`;
DROP PROCEDURE IF EXISTS `Teste_Criacao_Procedure_3`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Teste_Criacao_Procedure_1` ()
BEGIN
END$$

CREATE PROCEDURE `Teste_Criacao_Procedure_2` ()
BEGIN
	SELECT (1+1)*4 AS RESULTADO;
END$$

CREATE PROCEDURE `Teste_Criacao_Procedure_3` ()
BEGIN
	SELECT CONCAT("Meu nome é ", NOME) AS TEXTO FROM tabela_de_clientes;
END$$
DELIMITER ;
