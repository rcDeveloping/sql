/*
4.
a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto.\
*/
SELECT TOP 5 * FROM FactOnlineSales
SELECT * FROM DimCustomer
SELECT TOP 5 * FROM DimProduct

--a) Robert Long, Total_Purchases 376, CustomerKey 7665
SELECT
	DimCustomer.CustomerKey,
	CONCAT(FirstName, ' ', LastName) AS Name,
	FORMAT(SUM(SalesQuantity), 'N') AS Total_Purchases
FROM FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
GROUP BY DimCustomer.CustomerKey, CONCAT(FirstName, ' ', LastName)
HAVING CONCAT(FirstName, ' ', LastName) <> ''
ORDER BY SUM(SalesQuantity) DESC;

--b)
SELECT TOP 10 
	CustomerKey,
	ProductName,
	FORMAT(SUM(SalesQuantity), 'N') AS Total_Purchases
FROM FactOnlineSales
	INNER JOIN DimProduct
		ON FactOnlineSales.ProductKey = DimProduct.ProductKey
GROUP BY CustomerKey, ProductName
HAVING CustomerKey = 7665
ORDER BY SUM(SalesQuantity) DESC;
