--ALTER VIEW
ALTER VIEW vwClients AS
SELECT
	CustomerKey,
	CONCAT(FirstName, ' ', LastName) Name,
	Gender,
	EmailAddress,
	BirthDate
FROM DimCustomer;