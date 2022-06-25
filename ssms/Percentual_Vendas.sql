/*** % de participação de cada loja em relação ao total de vendas ***/
SELECT 
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER() AS 'Total Vendido',
	ROUND(Qtd_Vendida / SUM(Qtd_Vendida) OVER(), 2) AS '% do Total'
FROM Lojas
ORDER BY ID_Loja;