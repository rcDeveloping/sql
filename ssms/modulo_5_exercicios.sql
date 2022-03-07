--MÓDULO 5: EXERCÍCIOS

/*
1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade Devolvida para o canal de venda mais importante da empresa: Store.
*/

SELECT 
	FORMAT(SUM(SalesQuantity), 'N') AS Quant_Vendida,
	FORMAT(SUM(ReturnQuantity), 'N') AS Quant_Devolvida,
	ROUND(SUM(ReturnQuantity) / 1.0 / SUM(SalesQuantity) * 100.0, 2) AS Percentual_Devolucao
FROM FactSales
WHERE channelKey = 1;

/*
2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse resultado.
*/
SELECT
	FORMAT(ROUND(AVG(YearlyIncome), 2), 'N') AS Media_Salarial_Anual
FROM DimCustomer
WHERE Occupation = 'Professional';

/*
3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na empresa. O seu gerente te pediu os seguintes números e informações:
a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?
*/
SELECT 
	MAX(EmployeeCount) AS Max_Empregados,
	MIN(EmployeeCount) AS Min_Empregados
FROM DimStore
WHERE Status = 'On';


SELECT 
	StoreName AS Nome_Loja,
	EmployeeCount AS Num_Empregados
FROM DimStore
WHERE Status = 'On' AND EmployeeCount = (SELECT MAX(EmployeeCount) FROM DimStore) 
	OR EmployeeCount = (SELECT MIN(EmployeeCount) FROM DimStore);


/*
4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade total de funcionários do sexo Masculino e do sexo Feminino.
a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.
*/

/*SELECT Gender AS Sexo_Masc FROM DimEmployee
WHERE Gender = 'M'
FROM DimEmployee;

SELECT Gender AS Sexo_Fem FROM DimEmployee
WHERE Gender = 'F'
FROM DimEmployee;*/

--A) Num. Funcionários Por Sexo
SELECT 
	CASE WHEN Gender = 'M' THEN 'Masculino'
		WHEN Gender = 'F' THEN 'Feminino' 
	END AS Sexo,
	COUNT(Gender) AS Num_Empregados	
FROM DimEmployee
GROUP BY Gender;

--B) Funcionário e Funcionária mais antigos
SELECT
	CONCAT(FirstName, ' ', LastName) AS Nome,
	Gender AS Sexo,
	MIN(HireDate) AS Data_Contratacao,
	EmailAddress AS Email
FROM DimEmployee
GROUP BY Gender, CONCAT(FirstName, ' ', LastName), EmailAddress
ORDER BY 
	CASE WHEN Gender = 'M' THEN MIN(HireDate) END ASC,
		CASE WHEN Gender = 'F' THEN MIN(HireDate )
	END ASC;

SELECT TOP 1
	CONCAT(FirstName, ' ', LastName) AS Name,
	HireDate
FROM DimEmployee 
WHERE Gender = 'M'
ORDER BY HireDate ASC;

SELECT TOP 1
	CONCAT(FirstName, ' ', LastName) AS Name,
	HireDate
FROM DimEmployee 
WHERE Gender = 'F'
ORDER BY HireDate ASC;


/*
5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes informações:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta.
*/
SELECT 
	COUNT(DISTINCT BrandName) AS Marca,
	COUNT(DISTINCT ColorName) AS Cor,
	COUNT(DISTINCT ClassName) AS Classe 
FROM DimProduct;