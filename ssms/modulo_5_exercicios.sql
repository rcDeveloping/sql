--M�DULO 5: EXERC�CIOS

/*
1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade Devolvida para o canal de venda mais importante da empresa: Store.
*/

SELECT 
	FORMAT(SUM(SalesQuantity), 'N') AS Quant_Vendida,
	FORMAT(SUM(ReturnQuantity), 'N') AS Quant_Devolvida,
	ROUND(SUM(ReturnQuantity) / 1.0 / SUM(SalesQuantity) * 100.0, 2) AS Percentual_Devolucao
FROM FactSales
WHERE channelKey = 1;

/*
2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse resultado.
*/
SELECT
	FORMAT(ROUND(AVG(YearlyIncome), 2), 'N') AS Media_Salarial_Anual
FROM DimCustomer
WHERE Occupation = 'Professional';

/*
3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na empresa. O seu gerente te pediu os seguintes n�meros e informa��es:
a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?
c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?
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
4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade total de funcion�rios do sexo Masculino e do sexo Feminino.
a) Descubra essas duas informa��es utilizando o SQL.
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.
*/

/*SELECT Gender AS Sexo_Masc FROM DimEmployee
WHERE Gender = 'M'
FROM DimEmployee;

SELECT Gender AS Sexo_Fem FROM DimEmployee
WHERE Gender = 'F'
FROM DimEmployee;*/

--A) Num. Funcion�rios Por Sexo
SELECT 
	CASE WHEN Gender = 'M' THEN 'Masculino'
		WHEN Gender = 'F' THEN 'Feminino' 
	END AS Sexo,
	COUNT(Gender) AS Num_Empregados	
FROM DimEmployee
GROUP BY Gender;

--B) Funcion�rio e Funcion�ria mais antigos
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
5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes informa��es:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, voc� pode fazer isso em uma mesma consulta.
*/
SELECT 
	COUNT(DISTINCT BrandName) AS Marca,
	COUNT(DISTINCT ColorName) AS Cor,
	COUNT(DISTINCT ClassName) AS Classe 
FROM DimProduct;