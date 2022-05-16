/***UPPER AND LOWER***/
SELECT
	FirstName,
	UPPER(FirstName) AS UpperName,
	LOWER(FirstName) AS LowerName
FROM DimCustomer;