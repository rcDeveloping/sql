--M�DULO 6: EXERC�CIOS

/*
1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).
b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).
c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.
*/
SELECT 
	channelkey AS Canal_Venda,
	FORMAT(COUNT(SalesQuantity), 'N') AS Quant_Venda,
	FORMAT(COUNT(ReturnQuantity), 'N') AS Quant_Devolvida,
	ROUND((COUNT(ReturnQuantity) / 1.0) / COUNT(SalesQuantity * 100),2,0) AS Percentual_Devolvido,
	FORMAT(SUM(SalesAmount), 'N') AS Valor_Venda
FROM FactSales
GROUP BY channelkey
ORDER BY channelkey;

--VALOR VENDIDO EM 2007
SELECT 
	channelkey AS Canal_Venda,
	FORMAT(COUNT(SalesQuantity), 'N') AS Quant_Venda,
	FORMAT(COUNT(ReturnQuantity), 'N') AS Quant_Devolvida,
	ROUND((COUNT(ReturnQuantity) / 1.0) / (COUNT(SalesQuantity) * 100), 2, 0) AS Percentual_Devolvido,
	FORMAT(ROUND(SUM(SalesAmount), 2), 'N') AS Valor_Venda
FROM FactSales
WHERE YEAR(DateKey) = 2007
--WHERE DateKey BETWEEN '20070101' AND '20071231'
GROUP BY channelkey
ORDER BY SUM(SalesAmount) DESC;


/*
2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor total vendido (SalesAmount) por produto (ProductKey).
a) A tabela final dever� estar ordenada de acordo com o valor vendidO e, al�m disso, mostrar apenas os produtos que tiveram um resultado final de vendas maior ou igual a $5.000.000.
b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com maior valor de vendas. Desconsidere o filtro de $5.000.000 aplicado.
*/
SELECT 
	ProductKey AS id_Produto,
	FORMAT(ROUND(SUM(SalesAmount), 2), 'N') AS Valor_Venda 
FROM FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY SUM(SalesAmount) DESC;


SELECT TOP 10
	ProductKey AS id_Produto,
	COUNT(SalesQuantity) AS Quant_Venda,
	FORMAT(ROUND(SUM(SalesAmount), 2), 'N') AS Valor_Venda 
FROM FactSales
GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC;

/*
3. 
a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/
SELECT TOP 10
	CustomerKey AS id_Cliente,
	FORMAT(SUM(SalesQuantity), 'N') AS Valor_Compras
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC;

SELECT TOP 3
	ProductKey AS id_Produto,
	FORMAT(SUM(SalesQuantity), 'N') AS Valor_Compras
FROM FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC;

/*
4.
a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
*/
--Quantidade total de Produtos por Marca
SELECT
	BrandName AS Marca,
	COUNT(ProductKey) AS Qaunt_Produto
FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(ProductKey) DESC;


-- UnitPrice Medio Por ClassName
SELECT 
	ClassName AS Nome_Classe,
	AVG(UnitPrice) AS Media_Preco_Unit
FROM DimProduct
GROUP BY ClassName;

--Quantidade total de Produtos por Marca
SELECT
	ColorName AS Cor,
	COUNT(ProductKey) AS Qaunt_Produto,
	FORMAT(ROUND(SUM(Weight), 2), 'N') AS Peso
FROM DimProduct
GROUP BY ColorName
ORDER BY COUNT(ProductKey) DESC;

/*
5.
Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em ordem decrescente.
*/
SELECT 
	StockTypeName AS Tipo_Produto,
	WeightUnitMeasureID AS Unidade_Peso,
	FORMAT(SUM(Weight), 'N') AS Peso_Total
FROM DimProduct
WHERE WeightUnitMeasureID IS NOT NULL AND Weight IS NOT NULL OR BrandName = 'Contoso'
GROUP BY StockTypeName, WeightUnitMeasureID
HAVING WeightUnitMeasureID IS NOT NULL
ORDER BY SUM(Weight);


/*
6.
Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as 16 op��es de cores?
*/
SELECT
	BrandName AS Marca,
	COUNT(DISTINCT ColorName) AS Quant_Cores
FROM DimProduct
GROUP BY BrandName;

/*
7.
Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus conhecimentos em SQL.
*/
SELECT 
	Gender AS Sexo, 
	COUNT(CustomerKey) AS Quant_Clientes,
	FORMAT(AVG(YearlyIncome), 'N') AS Media_Salario_Anual
FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender;


/*
8.
Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer esse agrupamento.
*/
SELECT 
	Education AS Nivel_Escolar,
	FORMAT(COUNT(CustomerKey), 'N') AS Quant_Clientes,
	FORMAT(AVG(YearlyIncome), 'N') AS Media_Salario_Anual 
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education
ORDER BY Education;

/*
9
Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os funcion�rios ativos.
*/
SELECT 
	DepartmentName AS Departamento,
	COUNT(EmployeeKey) AS Num_Funcionarios
FROM DimEmployee
WHERE Status = 'Current'
GROUP BY DepartmentName
ORDER BY COUNT(EmployeeKey) DESC;

/*
10.
Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc� deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.
*/
SELECT
	CONCAT(FirstName, ' ', LastName) AS Nome,
	Title AS Cargo,
	SUM(VacationHours) AS Horas_Folga
FROM DimEmployee
WHERE Gender = 'F' 
	AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance')
		AND YEAR(HireDate) BETWEEN 1999 AND 2000
GROUP BY CONCAT(FirstName, ' ', LastName), Title;

SELECT
	Title AS Cargo,
	SUM(VacationHours) AS Horas_Folga
FROM DimEmployee
WHERE Gender = 'F' 
	AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance')
		AND YEAR(HireDate) BETWEEN 1999 AND 2000
GROUP BY Title;