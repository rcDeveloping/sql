/***Caso o produto seja da marca Contoso e da cor vermelho, desconto do produto será 10%.
Caso contrário, não terá desconto.
***/
SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red'
		THEN 0.1
		ELSE 0 
	END AS OffPrice
FROM DimProduct;

--SELECT SQL_VARIANT_PROPERTY(UnitPrice, 'BaseType')
--FROM DimProduct;