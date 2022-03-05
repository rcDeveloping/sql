/*
5. 
Faça um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes.
*/
--SELECT TOP 3 * FROM FactOnlineSales
--SELECT TOP 3 * FROM DimCustomer

SELECT 
	Gender,
	FORMAT(SUM(SalesQuantity), 'N') AS Total_Sales
FROM FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
GROUP BY Gender
HAVING Gender IS NOT NULL
ORDER BY SUM(SalesQuantity) DESC;