-- Filtrar todos os clientes cujo primeiro nome inicia e termina com a letra "A"
SELECT
	CONCAT(FirstName, ' ',	LastName) AS Name,
	EmailAddress,
	Phone
	
FROM DimCustomer

WHERE FirstName LIKE 'A%A'

ORDER BY FirstName;

-- Filtrar todos os clientes cujo primeiro nome termina com as letras "nna"
SELECT
	CONCAT(FirstName, ' ',	LastName) AS Name,
	EmailAddress,
	Phone
	
FROM DimCustomer

WHERE FirstName LIKE '%nna'

ORDER BY FirstName;

-- Filtrar os clientes cujo primeiro nome inicia com "C" e a terceira letra eh "r"
SELECT
	CONCAT(FirstName, ' ',	LastName) AS Name,
	EmailAddress,
	Phone
	
FROM DimCustomer

WHERE FirstName LIKE 'C_r%'

ORDER BY FirstName;

--Filtrar a coluna "ProductDescription" da DimProduct, onde todos os produtos terminam com a descrição "WMA"
SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%WMA';

--Filtrar a coluna "ProductDescription" da tabela "DimProduct", onde todos os produtos começam com a descrição "4GB"
SELECT * FROM DimProduct
WHERE ProductDescription LIKE '4GB%';
