/*** FORMAT ***/

-->> Number Format
--General
SELECT FORMAT(5123, 'G') AS General;

--Number
SELECT FORMAT(5123, 'N') AS Numeric;

--COIN
SELECT FORMAT(5123, 'C') AS Coin;

-->> Date Format
--dd/MM/yyyy
SELECT FORMAT(CAST('2020/04/23' AS DATETIME), 'dd/MM/yyyy')

SELECT FORMAT(CAST('2020/04/23' AS DATETIME), 'MMM dd, yyyy', 'en-US') AS Data_US;

SELECT FORMAT(CAST('2020/04/23' AS DATETIME), 'dd \de MMMM \de yyyy', 'pt-BR') AS Data_Brasil;

--day
SELECT FORMAT(CAST('2020/04/23' AS DATETIME), 'ddd') AS Day_Short;
SELECT FORMAT(CAST('2020/04/23' AS DATETIME), 'dddd') AS 'Day';

--
SELECT FORMAT(1234567, '##-##-###');