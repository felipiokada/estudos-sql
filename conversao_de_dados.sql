/* CONVERSÃO DE DADOS */

/*formata Data para String*/
SELECT CONCAT('Aniversário: ', CURDATE()) AS `ANIVERSÁRIO`;
SELECT CONCAT('Ano do aniversário do cachorro: ', DATE_FORMAT(CURDATE(), '%Y')) AS `CACHORRO`;	/*ano atual inteiro*/
SELECT CONCAT('Ano do aniversário do cachorro: ', DATE_FORMAT(CURDATE(), '%y')) AS `CACHORRO`;	/*os últimos dois digitos do ano atual*/
SELECT CONCAT('Mês festivos da empresa: ', DATE_FORMAT(CURDATE(), '%M')) AS `FESTIVAIS`;	/*August*/
SELECT CONCAT('Mês festivos da empresa: ', DATE_FORMAT(CURDATE(), '%m')) AS `FESTIVAIS`;	/*08*/