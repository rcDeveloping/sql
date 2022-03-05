/*
9. 
Faça um agrupamento de quantidade de produtos por ProductSubcategoryName. Leve em consideração em sua análise apenas a marca Contoso e a cor Silver.
*/
SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory
SELECT * FROM FactInventory

SELECT 
	ProductSubcategoryName,
	COUNT(*) AS Product_Quant
FROM DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE BrandName = 'Contoso' AND ColorName = 'Silver'
GROUP BY ProductSubcategoryName;






/*
10.
Faça um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. A tabela final deverá ser ordenada de acordo com a coluna BrandName.
*/
SELECT 
	BrandName,
	ProductSubcategoryName,
	COUNT(*) AS Product_Quant
FROM DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY BrandName, ProductSubcategoryName
ORDER BY BrandName;

/*
11. 
Faça um agrupamento de quantidade de produtos em estoque por ProductSubcategoryName. Leve em consideração em sua análise apenas a marca Contoso e a cor Silver.
*/
SELECT
	BrandName,
	ColorName,
	ProductSubcategoryName,
	FORMAT(SUM(SafetyStockQuantity), 'N') AS Stock
FROM DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN FactInventory
		ON DimProduct.ProductKey = FactInventory.ProductKey
GROUP BY BrandName, ColorName, ProductSubcategoryName
HAVING BrandName = 'Contoso' AND ColorName = 'Silver'
ORDER BY SUM(SafetyStockQuantity);