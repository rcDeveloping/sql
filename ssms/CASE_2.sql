/***Caso o produto seja da marca Contoso e da cor vermelho, desconto do produto ser� 10%.
Caso contr�rio, n�o ter� desconto.
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