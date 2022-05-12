--REPLACE: Substitui um determinado texto por outro.
--Substituir Excel por SQL

DECLARE @txt VARCHAR(50) = 'Excel eh o melhor'

SELECT REPLACE(@txt, 'Excel', 'SQL');

/*
Crie uma consulta a partir de DimCustomer, retornando o Nome Completo dos Clientes.
A coluna de Sexo (abreviado) e um outra de sexo substituindo M por Masculino e F por Feminino.
*/

SELECT 
	CONCAT(FirstName, ' ', LastName) AS Nome,
	Gender AS Cod_Sexo,
	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino')  AS Sexo
FROM DimCustomer;
