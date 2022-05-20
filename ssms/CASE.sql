SELECT 
	CustomerKey,
	CONCAT(FirstName, ' ', LastName) AS Name,
	Gender AS GenderCode,
	CASE WHEN Gender = 'M'
		THEN 'Masculine'
		ELSE 'Feminine'
	END AS Gender
FROM DimCustomer
WHERE Gender IS NOT NULL;