/*** MÓDULO 11: EXERCÍCIOS
6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo.
Atenção: lembre-se que existem lojas que foram fechadas.
***/
SELECT 
	StoreKey,
	StoreName,
	OpenDate,
	CloseDate,
	Status,
	CASE
		WHEN Status = 'On'
		THEN DATEDIFF(DAY, OpenDate, GETDATE())
		ELSE DATEDIFF(DAY, CloseDate, GETDATE())
	END AS Op_Time
FROM DimStore

ORDER BY [Op_Time] DESC;