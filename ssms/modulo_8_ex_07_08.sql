/*
7.
Descubra o valor total na tabela FactStrategyPlan destinado aos cenários: Actual e Budget.
*/
--SELECT TOP 5 * FROM FactStrategyPlan
--SELECT TOP 5 * FROM DimScenario

SELECT 
	ScenarioDescription,
	FORMAT(SUM(Amount), 'N') AS Total_Amount
FROM FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
GROUP BY ScenarioDescription
HAVING ScenarioDescription <> 'Forecast'
ORDER BY SUM(Amount) DESC;

/*
8.
Faça uma tabela resumo mostrando o resultado do planejamento estratégico por ano.
*/
SELECT TOP 5 * FROM FactStrategyPlan
SELECT TOP 5 * FROM DimDate

SELECT 
	YEAR(DateKey) AS Year,
	FORMAT(SUM(Amount), 'N') AS Total_Amount
FROM FactStrategyPlan
GROUP BY YEAR(DateKey)

SELECT 
	CalendarYear AS Year,
	FORMAT(SUM(Amount), 'N') AS Total_Amount
FROM FactStrategyPlan
INNER JOIN DimDate
	ON FactStrategyPlan.Datekey = DimDate.Datekey
GROUP BY CalendarYear
