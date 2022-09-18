/* Parâmetros */

USE sucos_vendas;
DROP PROCEDURE IF EXISTS `sp_stored_procedure_com_parametros`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE sp_stored_procedure_com_parametros(vCodigo VARCHAR(50), vNome VARCHAR(50), vSabor varchar(50), 
vTamanho VARCHAR (50), vEmbalagem VARCHAR (50), vPreco DECIMAL(10,2))
BEGIN
	INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
    VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);
END $$

DELIMITER ;