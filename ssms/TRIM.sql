--TRIM
--LTRIM
--RTRIM
DECLARE @cod VARCHAR(50) = '   ABC123   ';

SELECT 
	TRIM(@cod) AS TRIM,
	LTRIM(@cod) AS LTRIM,
	RTRIM(@cod) AS RTRIM;

SELECT 
	DATALENGTH(TRIM(@cod)) AS TRIM,
	DATALENGTH(LTRIM(@cod)) AS LTRIM,
	DATALENGTH(RTRIM(@cod)) AS RTRIM;