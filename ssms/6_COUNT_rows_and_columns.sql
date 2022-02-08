--contar o num. de linhas de uma tabela
SELECT COUNT(*) FROM DimProduct;

--contar o num. de colunas de uma tabela
SELECT COUNT(*) 
	FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'ContosoRetailDW' -- database name
	AND TABLE_NAME = 'DimProduct' -- table name
