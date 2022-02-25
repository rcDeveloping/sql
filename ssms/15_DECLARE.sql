DECLARE @AmountSales INT;
DECLARE @UnitPrice FLOAT;
SET @AmountSales = 100;
SET @UnitPrice = 89.99;

SELECT FORMAT(@AmountSales * @UnitPrice, 'N') AS ValueSold;


