/*
3.
Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto (ProductCategoryName). Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação entre FactSales e DimProductCategory não é direta.
*/
SELECT TOP 5 * FROM FactSales
SELECT TOP 5 * FROM DimProduct
SELECT TOP 5 * FROM DimProductSubcategory
SELECT TOP 5 * FROM DimProductCategory


SELECT 
	ProductCategoryName,
	FORMAT(SUM(SalesQuantity), 'N') AS Sales_Sum
FROM FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
		INNER JOIN DimProductSubcategory
			ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
				INNER JOIN DimProductCategory
					ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY ProductCategoryName
ORDER BY SUM(SalesQuantity);
