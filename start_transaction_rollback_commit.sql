/* START TRANSACTION - ROLLBACK - COMMIT */
/* START TRANSACTION: inicia uma ou várias operações de transação em que os dados deletados, alterados
	ou modificados podem ser confirmados ao final com o comando COMMIT ou retornados como eram
	anteriormente com o comando ROLLBACK*/
    
/* Exemplo 1 */
START TRANSACTION;
SELECT * FROM VENDEDORES;	/* TABELA ORIGINAL */
UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.2;
SELECT * FROM VENDEDORES;	/* TABELA COM COMISSÃO MODIFICADA */
ROLLBACK;
SELECT * FROM VENDEDORES;	/* Como o comando ROLLBACK foi chamado, a tabela voltou ao seu formato original. FINALIZA O TRANSACTION */

/* Exemplo 2 */
START TRANSACTION;
SELECT * FROM VENDEDORES;	/* TABELA ORIGINAL */
UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.2;
SELECT * FROM VENDEDORES;	/* TABELA COM COMISSÃO MODIFICADA */
COMMIT;
SELECT * FROM VENDEDORES;	/* COMMIT confirma todas as modificações feitas. FINALIZA O TRANSACTION */