/* INSERIR VALORES EM UMA TABELA */

USE vendas_suco;

INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES('1040107', 'Light - 350ml - Melancia', 'Melancia', '350ml', 'Lata', 4.56);

INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES('1040109', 'Light - 350ml - Açai', 'Açai', '350ml', 'Lata', 5.60);

/* Pode até usar sem declarar os campos, porém os dados serão inseridos na ordem dos campos criados da tabela */
INSERT INTO PRODUTOS VALUES('1040100', 'Light - 350ml - Graviola', 'Graviola', '350ml', 'Lata', 4.00);

/* Inserir vários valores ao mesmo tempo */
INSERT INTO PRODUTOS(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES('1040110', 'Light - 350ml - Jaca', 'Jaca', '350ml', 'Lata', 6.00),
('1040111', 'Light - 350ml - Manga', 'Manga', '350ml', 'Lata', 3.50);

INSERT INTO CLIENTES(CPF, NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_CREDITO, PRIMEIRA_COMPRA)
VALUES('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP', '80012212', "1990-09-01", 27, 'F', 170000, 24500, 0),
	  ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro', 'RJ', '22000000', "200-02-12", 18, 'M', 100000, 20000, 1),
	  (' 2600586709', 'César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', 22020001, "2000-03-12", 18,'M', 120000, 22000, 0);

SELECT * FROM PRODUTOS;
SELECT * FROM CLIENTES;
