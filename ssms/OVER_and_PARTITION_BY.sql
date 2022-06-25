/*** Mostrar o total de vendas ***/
USE WF
GO

SELECT
	--ID_Loja,
	--Nome_Loja,
	Regiao,
	--Qtd_Vendida,
	SUM(Qtd_Vendida) AS 'Total Vendido'
FROM Lojas
GROUP BY Regiao;

--TOTAL DE VENDAS
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER() AS 'Total Vendido'
FROM Lojas;

--TOTAL VENDIDO POR REGIAO
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Total Vendido'
FROM Lojas
ORDER BY 'Total Vendido';