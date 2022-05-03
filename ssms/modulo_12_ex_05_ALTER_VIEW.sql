/*** M�dulo 12 - Exerc�cios
5
Fa�a as seguintes altera��es nas tabelas da quest�o 1.
a. Na View criada na letra a da quest�o 1, adicione a coluna de BrandName.
b. Na View criada na letra b da quest�o 1, fa�a um filtro e considere apenas os funcion�rios do sexo feminino.
c. Na View criada na letra c da quest�o 1, fa�a uma altera��o e filtre apenas as lojas ativas.
***/

ALTER VIEW vwProdutos AS
SELECT
	ProductName,
	BrandName
	ColorName,
	UnitPrice,
	UnitCost
FROM DimProduct;

GO
SELECT * FROM vwProdutos;

GO
ALTER VIEW vwFuncionarios AS
SELECT 
	FirstName, 
	BirthDate, 
	DepartmentName
FROM DimEmployee
WHERE Gender = 'F';

GO
SELECT * FROM vwFuncionarios;

GO
ALTER VIEW vwLojas AS
SELECT
	StoreKey, 
	StoreName,
	OpenDate
FROM DimStore
WHERE Status = 'On';

GO 
SELECT * FROM vwLojas;