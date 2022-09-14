/* STORED PROCEDURES */
/* As linguagens estruturadas não têm padrão com outro banco de dado como Oracle, SQL Serve e etc */

USE `sucos_vendas`;
DROP procedure IF EXISTS `Teste_Criacao_Procedure`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Teste_Criacao_Procedure` ()
BEGIN

END$$

DELIMITER ;