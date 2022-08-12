/* Praticando o conceito de VIEW */

/*As boas práticas indicam que devemos escrever VW no início para indicar que aquela "tabela" é uma View*/

USE `sucos_vendas`;
CREATE  OR REPLACE VIEW `VW_MAIORES_EMBALAGENS` AS
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;