/*** MODULO 9 - EXERCICIOS ***/

/*
5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para uma subcategoria específica: ‘Lamps’.
Utilize o conceito de variáveis para chegar neste resultado.
*/

--SELECT TOP(50) * FROM DimProduct;
--SELECT * FROM DimProductSubcategory;

DECLARE @varIdSubcategoria INT
DECLARE @varNomeSubcategoria VARCHAR(30)

SET @varNomeSubcategoria = 'Lamps'
SET @varIdSubcategoria = (
	SELECT ProductSubcategoryKey 
	FROM DimProductSubcategory 
	WHERE ProductSubcategoryName = @varNomeSubcategoria
);

SELECT *
FROM DimProduct
WHERE ProductSubcategoryKey = @varIdSubcategoria;