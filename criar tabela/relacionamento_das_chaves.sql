USE vendas_suco;

CREATE TABLE IF NOT EXISTS VENDAS(
	`NUMERO` VARCHAR(5) NOT NULL,
	`DATA` DATE NULL,
	`CPF` VARCHAR(11) NOT NULL,
	`MATRICULA` VARCHAR(5) NOT NULL,
	`IMPOSTO` FLOAT NULL,
	PRIMARY KEY (`NUMERO`));

/* FORMA DIRETA DE INSERIR FK NA CRIAÇÃO DE TABELA */
CREATE TABLE IF NOT EXISTS VENDAS(
	NUMERO VARCHAR(5) NOT NULL,
	`DATA` DATE NULL,
	CPF VARCHAR(11) NOT NULL,
	MATRICULA VARCHAR(5) NOT NULL,
	IMPOSTO FLOAT NULL,
	PRIMARY KEY (NUMERO),
	FOREIGN KEY (MATRICULA) REFERENCES vendedores (MATRICULA),
	FOREIGN KEY (CPF) REFERENCES clientes (CPF));

/* OS CAMPOS PK FICAM EM NEGRITO E SUBLINHADOS, ENQUANTO FK FICAM SOMENTE EM NEGRITO */
/* SEQUÊNCIA: 	VENDAS -> A tabela que terá FK.
				FK_CLIENTES -> O nome do relacionamento (por padrão se escreve FK_ + o nome da tabela relacionada)
				(CPF) -> O campo da tabela VENDAS que será FK
                REFERENCES CLIENTES (CPF) -> Relacionada com o campo CPF da tabela CLIENTES*/
ALTER TABLE NOTAS ADD CONSTRAINT FK_CLIENTES FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);
ALTER TABLE NOTAS ADD CONSTRAINT FK_VENDEDORES FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);

/*Crie, por linha de comando, a chave estrangeira ligando a tabela de PRODUTOS com a tabela de
ITENS_NOTAS através do campo CODIGO e outra ligação entre a tabela NOTAS e ITENS_NOTAS através do campo NUMERO.*/
ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_PRODUTOS FOREIGN KEY (CODIGO) REFERENCES PRODUTOS (CODIGO);
ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_NOTAS FOREIGN KEY (NUMERO) REFERENCES NOTAS (NUMERO);

/* DELETAR UM RELACIONAMENTO DE FK:
	1 - DROP NA FK DAS N TABELAS RELACIONADAS
   	2 - DROP NO INDEX QUE ESSAS RELAÇÕES CRIAM*/
ALTER TABLE TABELA_DE_VENDAS DROP FOREIGN KEY FK_VENDEDORES;
ALTER TABLE TABELA_DE_VENDAS DROP FOREIGN KEY FK_CLIENTES;
ALTER TABLE TABELA_DE_VENDAS DROP INDEX FK_VENDEDORES;