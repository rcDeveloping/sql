/*** % de participação de cada loja em relação ao total de vendas ***/
SELECT 
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER() AS 'Total Vendido',
	--ROUND(Qtd_Vendida*100 / SUM(Qtd_Vendida) OVER(),2,2) AS '% do Total',
	FORMAT(Qtd_Vendida / SUM(Qtd_Vendida) OVER(), '0.00%') AS '% do Total'
FROM Lojas
ORDER BY ID_Loja;

--percentual de vendas por região
SELECT 
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Total Vendido',
	--ROUND(Qtd_Vendida*100 / SUM(Qtd_Vendida) OVER(),2,2) AS '% do Total',
	FORMAT(Qtd_Vendida / SUM(Qtd_Vendida) OVER(PARTITION BY Regiao), '0.00%') AS '% do Total'
FROM Lojas
ORDER BY Regiao;