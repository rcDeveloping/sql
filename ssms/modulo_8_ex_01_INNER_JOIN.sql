/*
1.
a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity, em ordem decrescente.
b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
c) Faça um resumo do valor total vendido (Sales Amount) para cada mês (CalendarMonthLabel) e ano (CalendarYear).
*/
SELECT 
DimChannel.ChannelName as Channel_Name,
FORMAT(SUM(SalesQuantity), 'N') AS Total_Sales
FROM FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SalesQuantity) DESC;


SELECT
	DimStore.StoreName AS Store_Name,
	FORMAT(SUM(SalesQuantity), 'N') AS Total_Sales,
	FORMAT(SUM(ReturnQuantity), 'N') AS Total_Returned
FROM FactSales
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName
ORDER BY SUM(ReturnQuantity);


SELECT
	DimDate.CalendarMonthLabel AS Month_Label,
	DimDate.CalendarYear AS Year,
	SUM(SalesAmount) AS Sales_Amount
FROM FactSales
INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
GROUP BY CalendarMonth, CalendarMonthLabel, CalendarYear
ORDER BY CalendarMonth;