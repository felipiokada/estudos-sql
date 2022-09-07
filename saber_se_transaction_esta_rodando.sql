/* Como saber o nível dos TRANSACTIONs rodando */

START TRANSACTION;
/* USE [BANCO DE DADOS] */

SELECT CPF = 19290992743  FROM clientes;
SELECT CPF FROM clientes WHERE CPF = 19290992743;
SELECT trx_state, trx_started FROM information_schema.INNODB_TRX;

ROLLBACK;