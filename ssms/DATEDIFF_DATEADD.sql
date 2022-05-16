--DATEADD: Adiciona ou subtrai uma determinada quantidade de dias, meses ou anos a uma data
--DATEDIFF: Calcula a diferenca entre duas datas

DECLARE @varDate1 DATE, @varDate2 DATE, @varDate3 DATE
SET @varDate1 = '2020/06/10'
SET @varDate2 = '2020/05/03'
SET @varDate3 = '2022/03/25'

--DATEADD
SELECT
	DATEADD(DAY, 30, @varDate1) AS ADD_10_days,
	DATEADD(MONTH, 1, @varDate1) AS ADD_1_month

--DATEDIFF
SELECT
	ABS(DATEDIFF(DAY, @varDate1, @varDate2))