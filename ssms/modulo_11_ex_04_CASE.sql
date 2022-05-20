/*** MÓDULO 11: EXERCÍCIOS
4. O setor de logística deverá realizar um transporte de carga dos produtos que estão no depósito de Seattle para o depósito de Sunnyside.
Não se tem muitas informações sobre os produtos que estão no depósito, apenas se sabe que existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 câmeras digitais, 100 ventiladores, e assim vai.
O gerente de logística definiu que os produtos serão transportados por duas rotas distintas. Além disso, a divisão dos produtos em cada uma das rotas será feita de acordo com as subcategorias (ou seja, todos os produtos de uma mesma subcategoria serão transportados pela mesma rota):
Rota 1: As subcategorias que tiverem uma soma total menor que 100 kg deverão ser transportados pela Rota 1.
Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 100 kg deverão ser transportados pela Rota 2.
Você deverá realizar uma consulta à tabela DimProduct e fazer essa divisão das subcategorias por cada rota. Algumas dicas:
- Dica 1: A sua consulta deverá ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota.
- Dica 2: Como não se sabe quais produtos existem no depósito, apenas que existem 100 exemplares de cada subcategoria, você deverá descobrir o peso médio de cada subcategoria e multiplicar essa média por 100, de forma que você descubra aproximadamente qual é o peso total dos produtos por subcategoria.
- Dica 3: Sua resposta final deverá ter um JOIN e um GROUP BY.
***/
DECLARE @Weight_Kg FLOAT;

SELECT 
	@Weight_Kg = CASE
		WHEN WeightUnitMeasureID = 'ounces'
		THEN Weight*0.0283495 -- ounces to kg
		WHEN WeightUnitMeasureID = 'pounds'
		THEN Weight*0.453592 -- pounds to kg
		WHEN WeightUnitMeasureID = 'grams'
		THEN Weight/1000.0 -- grams to kg
	END
FROM DimProduct
WHERE WeightUnitMeasureID IS NOT NULL AND WeightUnitMeasureID <> '';

SELECT 
	DimProductSubcategory.ProductSubcategoryName,
	SUM(@Weight_Kg)*100 AS Total_Weight,
	CASE
		WHEN SUM(@Weight_Kg)*100 >= 100.000 THEN 'Route 2'
		ELSE 'Route 1'
	END AS Route
FROM DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE WeightUnitMeasureID IS NOT NULL AND WeightUnitMeasureID <> ''
GROUP BY DimProductSubcategory.ProductSubcategoryName
ORDER BY DimProductSubcategory.ProductSubcategoryName;