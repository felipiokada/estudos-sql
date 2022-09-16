/* Padrão de Stored Procedures */

/* 	Nomes devem ter somente underscore(_), letras, números ou $ 
	Tamanho máximo de 64 caracteres
    Deve ser nome único
    É case sensitive
*/

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Teste_stored_procedure` ()
BEGIN
	SELECT "Procedure Teste_stored_procedure chamada!";
END$$
DELIMITER ;