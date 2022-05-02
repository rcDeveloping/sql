USE base;

SELECT
	ID_Cliente,
	CONCAT_WS(' ', Nome, Sobrenome) -- CONCAT(Nome, ' ', Sobrenome)
FROM clientes;

SET @FirstName = 'Anna';
SET @MiddleName = 'Whiteman';
SET @LastName = 'Jemm';

# SELECT CONCAT(@FirstName, ' ', @MiddleName, ' ', @LastName) AS Name;
SELECT CONCAT_WS(' ', @FirstName, @MiddleName, @LastName) AS Name;