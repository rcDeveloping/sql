/*** MÓDULO 11: EXERCÍCIOS
3. Será necessário criar uma categorização de cada loja da empresa considerando a quantidade de funcionários de cada uma. A lógica a ser seguida será:
EmployeeCount >= 50; 'Acima de 50 funcionários'
EmployeeCount >= 40; 'Entre 40 e 50 funcionários'
EmployeeCount >= 30; 'Entre 30 e 40 funcionários'
EmployeeCount >= 20; 'Entre 20 e 30 funcionários'
EmployeeCount >= 10; 'Entre 10 e 20 funcionários'
Caso contrário: 'Abaixo de 10 funcionários'
Faça uma consulta à tabela DimStore que retorne as seguintes informações: StoreName, EmployeeCount e a coluna de categoria, seguindo a regra acima.
***/
SELECT 
	StoreName,
	EmployeeCount,
	CASE
		WHEN EmployeeCount >= 50
		THEN 'Over de 50 employees'
		WHEN EmployeeCount >= 40
		THEN 'Between 40 and 50 employees'
		WHEN EmployeeCount >= 30
		THEN 'Between 30 and 40 employees'
		WHEN EmployeeCount >= 20
		THEN 'Between 20 and 30 employees'
		ELSE 'Between 10 and 20 employees'
	END AS CountEmplyeeCategory
FROM DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY StoreName;