/*UNION e UNION ALL*/
/* JUNTA TABELAS. OS CAMPOS OBRIGATORIAMENTE TEM QUE TER TIPOS DE DADOS IGUAIS, CASO CONTRÁRIO, NÃO FUNCIONARÁ */
SELECT DISTINCT BAIRRO FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

/* UNION não repetirá bairros */
SELECT BAIRRO FROM tabela_de_clientes
UNION
SELECT BAIRRO FROM tabela_de_vendedores
ORDER BY BAIRRO;	/*Aparecerá cada bairro */

/* O Bairro do ORDER BY é referente ao Bairro da tabela_de_clientes, pois se existir campos iguais, sempre
será considerado ao da primeira tabela decladara */

/* UNION ALL repetirá bairros */
SELECT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT BAIRRO FROM tabela_de_vendedores
ORDER BY BAIRRO;	/*Aparecerá vários bairros repetidos*/


/* Exemplo de UNION com dois campos*/
SELECT NOME, BAIRRO FROM tabela_de_clientes
UNION
SELECT NOME, BAIRRO FROM tabela_de_vendedores
ORDER BY BAIRRO;	

/* Fazer o comando FULL JOIN usando UNION */
SELECT tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME,
tabela_de_vendedores.NOME,
tabela_de_vendedores.BAIRRO
FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME,
tabela_de_vendedores.NOME,
tabela_de_vendedores.BAIRRO
FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

/*Exemplo de erro caso tente unir tabelas com números diferentes de campos*/
SELECT * FROM tabela_de_clientes
UNION
SELECT * FROM tabela_de_vendedores
ORDER BY BAIRRO;	/*Error Code: 1222. The used SELECT statements have a different number of columns*/

