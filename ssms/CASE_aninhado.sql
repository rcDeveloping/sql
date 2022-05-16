/***
DimEmployee

--> Title (cargo)
Sales Group Manager
Sales Region Manager
Sales State Manager
Sales Store Manager

--> SalariedFlag
0 não assalariado
1 assalariado

** Set Bonus **
Sales Group Manager: Assalariado, 30%. Não assalariado 20%.
Sales Region Manager: 15%
Sales State Manager: 7%
Sales Store Manager: 2%
***/
/*
SELECT
	EmployeeKey,
	CASE 
		WHEN MiddleName IS NOT NULL
		THEN CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
		ELSE CONCAT(FirstName, ' ', LastName)
	END AS Name,
	Title,
	SalariedFlag,
	CASE 
		WHEN Title = 'Sales Group Manager' AND SalariedFlag = 1
		THEN 0.30
		WHEN Title = 'Sales Group Manager' AND SalariedFlag = 0
		THEN 0.20
		WHEN Title = 'Sales Region Manager'
		THEN 0.15
		WHEN Title = 'Sales State Manager'
		THEN 0.07
		WHEN Title = 'Sales Store Manager'
		THEN 0.02
	END AS Bonus
FROM DimEmployee;
*/
SELECT
	EmployeeKey,
	CASE 
		WHEN MiddleName IS NOT NULL
		THEN CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
		ELSE CONCAT(FirstName, ' ', LastName)
	END AS Name,
	Title,
	SalariedFlag,
	CASE 
		WHEN Title = 'Sales Group Manager'
		THEN
			CASE 
				WHEN SalariedFlag = 1
				THEN 0.30
				ELSE 0.20
			END
		WHEN Title = 'Sales Region Manager'
		THEN 0.15
		WHEN Title = 'Sales State Manager'
		THEN 0.07
		WHEN Title = 'Sales Store Manager'
		THEN 0.02
	END AS Bonus
FROM DimEmployee;