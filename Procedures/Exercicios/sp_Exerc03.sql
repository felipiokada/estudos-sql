/*
Crie uma Stored procedure para reajustar o % de comissão dos vendedores.
Inclua como parâmetro da SP o %, expresso em valor (Ex: 0,90).

Nome da Stored Procedure: Reajuste_Comissao.*/

USE sucos_vendas;
DROP PROCEDURE IF EXISTS Reajuste_Comissao;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE Reajuste_Comissao(vPercentual FLOAT)
BEGIN
	UPDATE TABELA_DE_VENDEDORES SET PERCENTUAL_COMISSAO = PERCENTUAL_COMISSAO * (1 + vPercentual);
END $$

DELIMITER ;

SELECT * FROM tabela_de_vendedores;