/******  ******/

--Exemplo: Qual � o nome do produto que teve a maior quantidade de vendida em um �nica venda?

DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT

SELECT TOP(1)
	@varProdutoMaisVendido = ProductKey,
	@varTotalMaisVendido = SalesQuantity
FROM FactSales
ORDER BY SalesQuantity DESC;

/*
PRINT CONCAT('Productkey', ' ', @varProdutoMaisVendido)
PRINT CONCAT('SalesQuantity', ' ', @varTotalMaisVendido)
*/

SELECT 
	ProductKey,
	ProductName
FROM DimProduct
WHERE ProductKey = @varProdutoMaisVendido;