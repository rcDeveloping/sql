/****** Utilizando Variável em um consulta ******/
---Exemplo 1: Aplicar desconto de 10% em todos os preços dos produtos.
---A consulta final deve conter as colunas: ProductKey, ProductName, UnitPrice e Preço com desconto.

DECLARE @Discount FLOAT;
SET @Discount = 0.10;

SELECT 
	ProductKey,
	ProductName,
	UnitPrice,
	--(UnitPrice - UnitPrice * @Discount) AS DiscountPrice
	UnitPrice * (1 - @Discount) AS DiscountPrice
FROM DimProduct;

---Exemplo 2
DECLARE @varDate DATETIME;
SET @varDate = '1980-01-01';

SELECT
	CONCAT(FirstName, ' ', LastName) AS Name,
	BirthDate,
	'Client' AS 'Type'
FROM DimCustomer
WHERE BirthDate >= @varDate

UNION 

SELECT
	CONCAT(FirstName, ' ', LastName) AS Name,
	BirthDate,
	'Employee' AS 'Type'
FROM DimEmployee
WHERE BirthDate >= @varDate
ORDER BY BirthDate;

---Exemplo 3: Armazenando o resuktado de uma query em uma variável.
--Quantidade Total de Empregados
DECLARE @varEmployeeTotal INT;
SET @varEmployeeTotal = (SELECT COUNT(*) FROM DimEmployee);
SELECT @varEmployeeTotal AS Employee_Total;	

--Quantidade de Lojas Fechadas
DECLARE @varOffStore INT;
SET @varOffStore = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off');
SELECT @varOffStore AS Off_Store;