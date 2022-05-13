/*** VIEW ***/

CREATE VIEW vwClients AS
SELECT
	CustomerKey,
	CONCAT(FirstName, ' ', LastName) Name,
	EmailAddress,
	BirthDate
FROM DimCustomer;