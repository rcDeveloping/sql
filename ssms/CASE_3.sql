/***
Crie uma coluna �nica chamada "Client", contendo o nome do cliente, seja pessoa f�sica ou empresa.
Mostre tamb�m as colunas "CustomerKey" e "CustomerType"
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