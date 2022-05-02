USE BASE;

SELECT
	ID_Cliente,
    LCASE(Nome) AS 'LACASE',
    UCASE(Nome) AS 'UCASE'
FROM clientes;