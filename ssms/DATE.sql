/*** DAY, MONTH and YEAR ****/

DECLARE @varDate DATETIME = '20220323'

SELECT 
	DAY(@varDate) AS Day,
	MONTH(@varDate) AS Month,
	YEAR(@varDate) AS Year;



--Date from parts
DECLARE @Day INT = 23
DECLARE @Month INT = 03
DECLARE @Year INT = 2022

SELECT DATEFROMPARTS(@Year, @Month, @Day);
