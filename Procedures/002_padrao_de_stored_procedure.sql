/* Padrão de Stored Procedures */

/* 	Nomes devem ter somente underscore(_), letras, números ou $ 
	Utilize sp no início de cada stored procedure para indentificá-las mais facilmente
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
