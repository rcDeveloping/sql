/*** Módulo 12 - Exercícios
5
Faça as seguintes alterações nas tabelas da questão 1.
a. Na View criada na letra a da questão 1, adicione a coluna de BrandName.
b. Na View criada na letra b da questão 1, faça um filtro e considere apenas os funcionários do sexo feminino.
c. Na View criada na letra c da questão 1, faça uma alteração e filtre apenas as lojas ativas.
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