USE `sucos_vendas`;
DROP PROCEDURE IF EXISTS sp_Exerc01;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE sp_Exerc01 ()
BEGIN
	DECLARE nomeCliente VARCHAR(10);
    DECLARE idade INT(3);
    DECLARE dataNascimento DATE;
    DECLARE custo FLOAT(10,2);
    
    SET nomeCliente = 'João';
    SET idade = 10;
    SET dataNascimento = '2007-01-10';
    SET custo = 10.23;
    
    SELECT nomeCliente, idade, dataNascimento, custo;
    
END$$
DELIMITER ;

CALL sp_Exerc01();