/***
MÓDULO 10: EXERCÍCIOS

6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo.
***/

SELECT
	StoreKey,
	StoreType,
	StoreName,
	OpenDate,
	DATEDIFF(DAY, OpenDate, GETDATE()) AS 'Active Days'
FROM DimStore
WHERE Status = 'On';