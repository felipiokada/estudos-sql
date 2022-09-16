/* DELETAR OU ALTERAR UMA STORED PROCEDURE */

-- DELETAR STORED PROCEDURE
USE sucos_vendas;
DROP PROCEDURE Teste_Criacao_Procedure_1;

-- ALTERAR STORED PROCEDURE DO CÁLCULO (1 + 1) * 4 PARA SELECT SUM(VOLUME_DE_COMPRA) DA TABELA CLIENTES

DROP PROCEDURE IF EXISTS Teste_Criacao_Procedure_2;

DELIMITER $$
CREATE PROCEDURE Teste_Criacao_Procedure_2 ()
BEGIN
	SELECT SUM(VOLUME_DE_COMPRA) AS `VOLUME DE COMPRA TOTAL` FROM tabela_de_clientes;
END$$
DELIMITER ;