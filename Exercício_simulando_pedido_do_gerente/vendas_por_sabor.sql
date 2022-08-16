/* Relatório de vendas por sabor
	Pedido: Crie um relatório a pedido da área comercial da
        empresa de sucos de frutas. A solicitação é um acompanhamento sobre as
        vendas do ano de 2016 por sabores e eles gostariam de ver as informações
        no seguinte modelo:
        Na primeira coluna, são apresentados os sabores dos sucos. Na segunda, o
        ano analisado (2016). Na terceira coluna, temos a quantidade vendida no
        ano todo. Os dados devem ser ordenados do maior para o menor
        em relação a esta coluna. E, por fim, temos o percentual de participação
        comparado ao total de vendas.
 */
 
SELECT * FROM tabela_de_produtos;		/* TEM O SABOR */
SELECT * FROM itens_notas_fiscais;		/* TEM QUANTIDADE, TEM O CODIGO_DO_PRODUTO DA tabela_de_produtos E NUMERO PARA A notas_fiscais*/
SELECT * FROM notas_fiscais;			/* DATA_VENDA */