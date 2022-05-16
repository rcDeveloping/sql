--CONCAT: Permite juntar mais de um text em uma unica palavra
USE ContosoRetailDW;

SELECT
	CONCAT(FirstName, ' ', LastName)
FROM DimCustomer;