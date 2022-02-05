--Filtrar todos os clientes com o sobrenome MCdonald
SELECT
	CONCAT(FirstName, ' ',	LastName) AS Name,
	EmailAddress,
	Phone
	
FROM DimCustomer

WHERE LastName LIKE 'MCdonald'

ORDER BY FirstName;

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
