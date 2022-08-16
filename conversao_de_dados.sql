/* CONVERSÃO DE DADOS */

/*formata Data para String*/
SELECT CONCAT('Aniversário: ', CURDATE()) AS `ANIVERSÁRIO`;
SELECT CONCAT('Ano do aniversário do cachorro: ', DATE_FORMAT(CURDATE(), '%Y')) AS `CACHORRO`;	/*ano atual inteiro*/
SELECT CONCAT('Ano do aniversário do cachorro: ', DATE_FORMAT(CURDATE(), '%y')) AS `CACHORRO`;	/*os últimos dois digitos do ano atual*/
SELECT CONCAT('Mês festivos da empresa: ', DATE_FORMAT(CURDATE(), '%M')) AS `FESTIVAIS`;	/*August*/
SELECT CONCAT('Mês festivos da empresa: ', DATE_FORMAT(CURDATE(), '%m')) AS `FESTIVAIS`;	/*08*/

SELECT CONCAT('Mês com mais tarefas no ano: ', DATE_FORMAT('1996-02-22', '%c')) AS `MÊS`;	/*2*/
SELECT CONCAT('Mês com mais tarefas no ano: ', DATE_FORMAT('1996-02-22', '%b')) AS `MÊS`;	/*Feb*/
SELECT CONCAT('Mês com mais tarefas no ano: ', DATE_FORMAT('1996-02-22', '%M')) AS `MÊS`;	/*February*/
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%d/%m/%Y') AS `FORMATANDO A DATA EM DIA/MÊS/ANO`;
SELECT CONCAT('Agora são: ', DATE_FORMAT(CURRENT_TIMESTAMP(), '%H:%i')) AS `FORMATANDO PARA HORAS`;

SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%W') AS `RESULTADO`; /* dia da semana */
SELECT CONCAT('nº da semana do ano: ', DATE_FORMAT(CURRENT_TIMESTAMP(), '%U')) AS `RESULTADO`; 


/* ----- CONVERTENDO VALORES NUMÉRICOS EM STRING DIRETAMENTE ------- */
SELECT CONVERT(522.334, CHAR) AS `RESULTADO`;	/* Agora poderá utilizar as funções de String no 522.334*/
SELECT SUBSTRING(CONVERT(522.334, CHAR), 4) AS `RESULTADO`;	/* .334 */
