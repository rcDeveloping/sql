/*** MODULO 9 - EXERCICIOS ***/

/*
5. Voc� precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para uma subcategoria espec�fica: �Lamps�.
Utilize o conceito de vari�veis para chegar neste resultado.
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