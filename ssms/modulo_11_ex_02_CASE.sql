/*** MÓDULO 11: EXERCÍCIOS
2. Você ficou responsável pelo controle de produtos da empresa e deverá fazer uma análise da quantidade de produtos por Marca.
A divisão das marcas em categorias deverá ser a seguinte:
CATEGORIA A: Mais de 500 produtos
CATEGORIA B: Entre 100 e 500 produtos
CATEGORIA C: Menos de 100 produtos
Faça uma consulta à tabela DimProduct e retorne uma tabela com um agrupamento de Total de Produtos por Marca, além da coluna de Categoria, conforme a regra acima.
***/
SELECT TOP 15 * FROM DimProduct;
SELECT TOP 15 * FROM FactInventory;

SELECT 
	BrandName,
	COUNT(*) AS Count_Products,
	CASE
		WHEN COUNT(*) > 500 THEN 'A'
		WHEN COUNT(*) >= 100 THEN 'B'	
		ELSE 'C'
	END AS Category
FROM DimProduct
GROUP BY BrandName;

