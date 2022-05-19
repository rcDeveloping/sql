/****** PARTITION  ******/
USE ContosoRetailDW
GO

SELECT
	StoreName,
	CityName,
	SalesAmount,
	ROW_NUMBER() OVER (PARTITION BY StoreName ORDER BY SalesAmount DESC) AS 'Rank',
	SUM(SalesAmount) OVER (PARTITION BY StoreName) AS TotalOfSalesAmount
FROM FactOnlineSales
INNER JOIN DimStore
	ON FactOnlineSales.StoreKey = FactOnlineSales.StoreKey
INNER JOIN DimGeography
	ON DimStore.GeographyKey = DimGeography.GeographyKey
WHERE ContinentName = 'North America';