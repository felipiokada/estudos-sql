/* DECLARAR VARIÁVEIS NA STORED PROCEDURE */

USE `sucos_vendas`;
DROP PROCEDURE IF EXISTS `Atribuindo_valores`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Atribuindo_valores` ()
BEGIN
	DECLARE texto varchar(50) DEFAULT 'Nenhum valor';
    DECLARE textoSemDefault varchar(50);				-- Quando não tem default, o valor atribuido é null
    DECLARE dataDeCriacao DATE DEFAULT LOCALTIMESTAMP();
    DECLARE numeroInteiro int(10) DEFAULT 1;
    DECLARE numeroFlutuante double(20,4) DEFAULT 22.5;	-- (20, 4) 20 NÚMEROS sendo 4 para DEPOIS DA VÍRGULA
    DECLARE palavra1, palavra2, palavra3 VARCHAR(15) DEFAULT 'Nenhum valor';	-- Pode declarar várias variáveis para o mesmo valor
    SELECT texto, textoSemDefault, dataDeCriacao, numeroInteiro, numeroFlutuante, palavra1, palavra2, palavra3;
END $$
DELIMITER ;
