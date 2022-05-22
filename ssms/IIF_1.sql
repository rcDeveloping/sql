/***
Crie uma coluna �nica chamada "Client", contendo o nome do cliente, seja pessoa f�sica ou empresa.
Mostre tamb�m as colunas "CustomerKey" e "CustomerType"
***/

SELECT
	CustomerKey,
	CustomerType,
	IIF(
		CustomerType = 'Person', 
		--CONCAT(FirstName, ' ', MiddleName, ' ', LastName), 
		CONCAT(FirstName, ' ', LastName),
		CompanyName
	) AS ClientName

FROM DimCustomer


--SELECT TOP 10 * FROM DimCustomer