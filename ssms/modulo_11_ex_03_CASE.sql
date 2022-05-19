/*** M�DULO 11: EXERC�CIOS
3. Ser� necess�rio criar uma categoriza��o de cada loja da empresa considerando a quantidade de funcion�rios de cada uma. A l�gica a ser seguida ser�:
EmployeeCount >= 50; 'Acima de 50 funcion�rios'
EmployeeCount >= 40; 'Entre 40 e 50 funcion�rios'
EmployeeCount >= 30; 'Entre 30 e 40 funcion�rios'
EmployeeCount >= 20; 'Entre 20 e 30 funcion�rios'
EmployeeCount >= 10; 'Entre 10 e 20 funcion�rios'
Caso contr�rio: 'Abaixo de 10 funcion�rios'
Fa�a uma consulta � tabela DimStore que retorne as seguintes informa��es: StoreName, EmployeeCount e a coluna de categoria, seguindo a regra acima.
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