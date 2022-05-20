/*** M�DULO 11: EXERC�CIOS
6. Descubra qual � a loja que possui o maior tempo de atividade (em dias). Voc� dever� fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate como refer�ncia para esse c�lculo.
Aten��o: lembre-se que existem lojas que foram fechadas.
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