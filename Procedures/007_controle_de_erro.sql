/* Controle de erro */

/* 	Simulando um erro na coluna CODIGO_DO_PRODUTO porque não pode duplicar Primary key com a linha abaixo
	CALL sp_tratamento_erro('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50); */

/* Usa-se o comando DECLARE EXIT HANDLER FOR (NÚMERO DO ERRO) */

USE sucos_vendas;
DROP PROCEDURE IF EXISTS sp_tratamento_erro;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `sp_tratamento_erro`(vCodigo VARCHAR(50), vNome VARCHAR(50), vSabor varchar(50), 
vTamanho VARCHAR (50), vEmbalagem VARCHAR (50), vPreco DECIMAL(10,2))
BEGIN
	DECLARE mensagem VARCHAR(50);
    /* NÚMERO DO ERRO (Error Code: 1062) */
	DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SET mensagem = 'Problema com chave primária';
        SELECT mensagem;
    END;
	INSERT INTO tabela_de_produtos(CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
    VALUES(vCodigo, vNome, vEmbalagem, vTamanho, vSabor, vPreco);
    SET mensagem = 'Produto registrado';
    SELECT mensagem;
END $$
DELIMITER ;

CALL sp_tratamento_erro('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50);