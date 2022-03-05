/*
2.
Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesAmount) por produto.
a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).
b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000.
*/
SELECT 
	--DimProduct.ProductName AS Product_Name,
	DimProduct.ColorName AS Color_Name,
	FORMAT(SUM(SalesQuantity), 'N') AS Sales_Quantity
FROM FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
ORDER BY SUM(SalesQuantity) DESC;

SELECT 
	--DimProduct.ProductName AS Product_Name,
	DimProduct.ColorName AS Color_Name,
	FORMAT(SUM(SalesQuantity), 'N') AS Sales_Quantity
FROM FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
HAVING SUM(SalesQuantity) > 3000000
ORDER BY SUM(SalesQuantity) DESC;
