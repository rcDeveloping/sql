/***
Crie uma coluna única chamada "Client", contendo o nome do cliente, seja pessoa física ou empresa.
Mostre também as colunas "CustomerKey" e "CustomerType"
***/

SELECT
	CustomerKey,
	CustomerType,
	CASE
		WHEN CustomerType = 'Person' AND MiddleName IS NOT NULL
		THEN CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
		WHEN CustomerType = 'Person' AND MiddleName IS NULL
		THEN CONCAT(FirstName, ' ', LastName)
		ELSE CompanyName
	END AS ClintName
FROM DimCustomer;