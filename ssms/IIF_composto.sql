/***
Existem 3 tipos diferentes de estoque: High, Mid e Low.
Faça um SELECT contendo as colunas: ProductKey, StockTypeName e Charge/Responsible, de acordo com o tipo de estoque.
A regra deverá ser:
--> João é resposavel pelos produtos High
--> Maria por Mid
--> Luis por Low
***/
SELECT 
	ProductKey,
	StockTypeName,
	IIF(
		StockTypeName = 'High', 'Joao is in charge',
		IIF(StockTypeName = 'Mid', 'Maria is in charge', 'Luis is in charge')
	) AS Charge
FROM DimProduct;