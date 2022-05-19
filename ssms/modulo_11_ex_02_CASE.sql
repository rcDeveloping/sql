/*** M�DULO 11: EXERC�CIOS
2. Voc� ficou respons�vel pelo controle de produtos da empresa e dever� fazer uma an�lise da quantidade de produtos por Marca.
A divis�o das marcas em categorias dever� ser a seguinte:
CATEGORIA A: Mais de 500 produtos
CATEGORIA B: Entre 100 e 500 produtos
CATEGORIA C: Menos de 100 produtos
Fa�a uma consulta � tabela DimProduct e retorne uma tabela com um agrupamento de Total de Produtos por Marca, al�m da coluna de Categoria, conforme a regra acima.
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

