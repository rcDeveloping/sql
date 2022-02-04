/*
Introduction to SQL using Microsoft SQL Server Management Studio
*/

-- Get the 10 first rows from FactSales table
SELECT TOP(10) * FROM FactSales;

-- Get 10% percent of FactSales table rows
SELECT TOP(10) PERCENT * FROM FactSales;

-- Get only the distinct values from colorName column of DimProduct table
SELECT DISTINCT(colorName) FROM DimProduct;

--Renaming a column
SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS Marca,
	ColorName AS Cor
FROM DimProduct;


