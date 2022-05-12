/******
* GETDATE ------> Retorna a data/hora atual do sisteme.
* SYSDATETIME --> Retorna a data/hora atual do sisteme de forma mais precisa que GATEDATE.
* DATENAME -----> Retorna informacoes (dd, MM, yyyy, etc) de uma data.
* DATEPARTE ----> "           "            "              "   "   ".
******/

DECLARE @myDate DATETIME = GETDATE();

SELECT 
	GETDATE() AS GATEDATE,
	SYSDATETIME() AS SYSDATETIME,
	DATENAME(DAY, @myDate) AS DATENAME_day,
	DATENAME(MONTH, @myDate) AS DATENAME_month,
	DATENAME(YEAR, @myDate) AS DATENAME_year,
	DATENAME(DAYOFYEAR, @myDate) AS DATENAME_dayOfYear,
	DATENAME(WEEKDAY, @myDate) as DATENAME_weekday;


SELECT
	SQL_VARIANT_PROPERTY(DATENAME(DAY, @myDate), 'BaseType') DATENAME_day,
	SQL_VARIANT_PROPERTY(DATEPART(DAY, @myDate), 'BaseType') AS DATEPART_day;
