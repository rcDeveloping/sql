USE base;

SELECT 
	Nome,
    Estado_Civil AS Estado_Civil_Cod,
    REPLACE(REPLACE(Estado_Civil, 'S', 'Solteiro'), 'C', 'Casado') AS Estado_Civil
FROM clientes;