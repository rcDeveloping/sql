SELECT 
	SUM(SalesQuantity) AS 'Quant. Vendida',
	SUM(ReturnQuantity) AS 'Quant. Devolvida',

	--PERCENTUAL DE ITENS DEVOLVIDOS
	ROUND(((SUM(ReturnQuantity) / 1.0) / SUM(SalesQuantity) * 100.0), 2) AS Percentual

FROM FactSales;

