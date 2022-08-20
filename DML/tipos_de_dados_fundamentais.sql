/* Tipos de dados fundamentais */

/* 	tinyint (1Bytes), 
	smallint (2Bytes), 
    mediumint (3Bytes), 
    int	(4Bytes), 
    bigint (8Bytes)	*/
/* 	UNSIGNED: não é permitido valores negativos, somente positivos
	ZEROFILL: preenche os espaços com zeros 
    AUTO_INCREMENT: Incrementa automaticamente valores
    OUT_OF_RANGE: um tipo de erro quando estoura o limite
    */


/*	FLOAT precisão simples(4Bytes),
	DOUBLE precisão duplo(8Bytes)
    
    Ex.:	FLOAT (7,4)	= TOTAL: 7 dígitos com 4 números depois da vírgula. Caso tenha mais números, ele arredondará
*/

/*
	DECIMAL ou NUMERIC: suportam até 65 dígitos
*/

/*
	BIT (1) = 1 ou 0
    BIT (2) = 00, 01, 10, 11
    BIT (n)
*/

/*
	DATE: 		2022-01-20												1000-01-01 até 9999-12-31
	DATETIME: 	2022-01-20 13:43:33										1000-01-01 00:00:00 até 9999-12-31 23:59:59
    TIMESTAMP:	2022-01-20 13:43:33 UTC (Registra o fuso horário)		1970-01-01 00:00:01 até 2038-01-19 UTC
    TIME:		-893:59:59 até 893:59:59 (registra horas quaisquer)		
    YEAR: 		1901 até 2155
*/

/*
	CHAR (0 a 255)		ocupa todo o espaço disponível. Mesmo que tenha 2
						caracteres em um CHAR(4), estará todo preenchido.
    VARCHAR (0 a 255)	ocupa o espaço necessário. Se tiver 2 caracteres em
						um VARCHAR(4), estará com uma 'folga' 2 caracteres.
                        Esse tipo é mais 'inteligente' para eficiência
*/

/*
	BINARY
    VARBINARY
*/

/*	
	Servem para imagens
	BLOB, TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB
    
    TEXT: textos longos, que convertem valores binários para letras
    TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT
*/

/*
	ENUM: permite valores já enumerados ou pré-definidos
	Ex.:	ENUM('RUIM', 'BOM', 'ÓTIMO')
*/

/*
	SET e COLLATE: Tipo de conjunto de caracteres suportados
*/

/*
	SPACIAL: desenhar, traçar, áreas
    GEOMETRY, POINT, LINESTRING, POLYGON
*/
