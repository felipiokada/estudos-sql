/* ALTERANDO DADOS DOS REGISTROS */
SELECT * FROM CLIENTES WHERE CPF = "19290992743";
SELECT * FROM sucos_vendas.tabela_de_clientes WHERE CPF = "19290992743";

UPDATE CLIENTES 
SET 
    ENDERECO = 'R. Jorge Emílio 23',
    BAIRRO = 'Santo Amaro',
    CIDADE = 'São Paulo',
    ESTADO = 'SP',
    CEP = '8833223'
WHERE
    CPF = '19290992743';

/*Podemos observar que os vendedores possuem bairro associados a eles.
Vamos aumentar em 30% o volume de compra dos clientes que possuem, em seus 
endereços bairros onde os vendedores possuam escritórios.*/
SELECT BAIRRO FROM VENDEDORES;
SELECT BAIRRO, VOLUME_CREDITO FROM CLIENTES;

/* SÓ PARA ME ORIENTAR */
SELECT 
    B.BAIRRO AS BAIRRO_CLIENTE,
    B.VOLUME_CREDITO,
    A.BAIRRO AS BAIRRO_VENDEDORES,
    (VOLUME_CREDITO * 1.3) AS VOLUME_CREDITO_COM_30_PORCENTO
FROM
    VENDEDORES A
        INNER JOIN
    CLIENTES B ON A.BAIRRO = B.BAIRRO;

UPDATE CLIENTES A
        INNER JOIN
    VENDEDORES B ON A.BAIRRO = B.BAIRRO 
SET 
    A.VOLUME_CREDITO = A.VOLUME_CREDITO * 1.3;
