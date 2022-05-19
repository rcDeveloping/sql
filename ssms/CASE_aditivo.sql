/***
Os produtos da categoria 'TV and Video' ter�o um deconto de 10%
Se al�m de ser desta categoria, o produto for da subcategoria 'Televisores', recebr� mais 5%. Total 15%.
***/
SELECT
	ProductKey,
	ProductName,
	ProductCategoryName,
	ProductSubcategoryName,
	CASE
		WHEN ProductCategoryName = 'TV and Video' 
		THEN 0.10 
		ELSE 0 
	END
	+ CASE
		WHEN ProductSubcategoryName = 'Televisions'
		THEN 0.05
		ELSE 0
	END AS OffPrice
FROM DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;


--SELECT TOP 5 * FROM DimProduct;
--SELECT TOP 5 * FROM DimProductSubCategory;
--SELECT TOP 5 * FROM DimProductCategory;