/*** M�DULO 11: EXERC�CIOS
4. O setor de log�stica dever� realizar um transporte de carga dos produtos que est�o no dep�sito de Seattle para o dep�sito de Sunnyside.
N�o se tem muitas informa��es sobre os produtos que est�o no dep�sito, apenas se sabe que existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 c�meras digitais, 100 ventiladores, e assim vai.
O gerente de log�stica definiu que os produtos ser�o transportados por duas rotas distintas. Al�m disso, a divis�o dos produtos em cada uma das rotas ser� feita de acordo com as subcategorias (ou seja, todos os produtos de uma mesma subcategoria ser�o transportados pela mesma rota):
Rota 1: As subcategorias que tiverem uma soma total menor que 100 kg dever�o ser transportados pela Rota 1.
Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 100 kg dever�o ser transportados pela Rota 2.
Voc� dever� realizar uma consulta � tabela DimProduct e fazer essa divis�o das subcategorias por cada rota. Algumas dicas:
- Dica 1: A sua consulta dever� ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota.
- Dica 2: Como n�o se sabe quais produtos existem no dep�sito, apenas que existem 100 exemplares de cada subcategoria, voc� dever� descobrir o peso m�dio de cada subcategoria e multiplicar essa m�dia por 100, de forma que voc� descubra aproximadamente qual � o peso total dos produtos por subcategoria.
- Dica 3: Sua resposta final dever� ter um JOIN e um GROUP BY.
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