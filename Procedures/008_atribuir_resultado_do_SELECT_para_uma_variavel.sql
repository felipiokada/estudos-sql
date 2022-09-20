/* Atribuir um SELECT para uma variável */

USE sucos_vendas;
DROP PROCEDURE IF EXISTS sp_atribuir_resultado_do_SELECT_para_uma_variavel;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE sp_atribuir_resultado_do_SELECT_para_uma_variavel(vProduto VARCHAR(50))
BEGIN
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = vProduto;
    SELECT vSabor;
END$$
DELIMITER ;

CALL sp_atribuir_resultado_do_SELECT_para_uma_variavel('2001001');