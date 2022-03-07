DECLARE @varNameList VARCHAR(255)
SET @varNameList = ''

SELECT 
	@varNameList = @varNameList + CONCAT(FirstName, ' ', LastName) + ', ' + CHAR(10)
FROM DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F';

PRINT LEFT(@varNameList, DATALENGTH(@varNameList) -3);