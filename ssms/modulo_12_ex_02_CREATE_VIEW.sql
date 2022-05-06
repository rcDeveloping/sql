/*** M�dulo 12 - Exerc�cios

2. Crie uma View contendo as informa��es de Nome Completo (FirstName + LastName), G�nero (por extenso), E-mail e Renda Anual (formatada com R$). Utilize a tabela DimCustomer. Chame essa View de vwClientes.
***/
CREATE VIEW vwClientes AS
SELECT
	CONCAT(FirstName, ' ', LastName) AS Name,
	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS Gender,
	EmailAddress,
	FORMAT(YearlyIncome, 'C') AS YearlyIncome
FROM DimCustomer;

GO
SELECT * FROM vwClientes;