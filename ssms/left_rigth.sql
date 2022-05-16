/***LEFT and RIGHT***/
--LEFT - Etrai uma determinada quantidade de caracteres de um textp, da esquerda para a direita
SELECT LEFT('Product0101001', 7);

--RIGHT - Etrai uma determinada quantidade de caracteres de um texto, da direita para a esquerda
SELECT RIGHT('Product0101001', 7);

SELECT 
	ProductName,
	UnitPrice,
	StyleName,
	LEFT(StyleName, 7) AS 'Cod. 1',
	RIGHT(StyleName, 7) AS 'Cod 2'
FROM DimProduct;