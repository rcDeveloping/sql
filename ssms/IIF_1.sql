/***
Crie uma coluna única chamada "Client", contendo o nome do cliente, seja pessoa física ou empresa.
Mostre também as colunas "CustomerKey" e "CustomerType"
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