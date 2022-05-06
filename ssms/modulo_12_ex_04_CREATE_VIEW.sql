/*** Módulo 12 - Exercícios
4. 
Crie uma View que seja o resultado de um agrupamento da tabela FactSales. Este agrupamento deve considerar o SalesQuantity (Quantidade Total Vendida) por Nome do Produto. Chame esta View de vwTotalVendidoProdutos.
***/

CREATE VIEW vwTotalVendidoProdutos AS
SELECT 
	DimProduct.ProductName,
	SUM(SalesQuantity) AS TotalSalesQuantity
FROM FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY DimProduct.ProductName;

GO
SELECT TOP 100 * FROM vwTotalVendidoProdutos;