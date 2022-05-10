/*** MÓDULO 10: EXERCÍCIOS
3. O setor de TI está criando um sistema para acompanhamento individual de cada funcionário da empresa Contoso. Cada funcionário receberá um login e senha. O login de cada funcionário será o ID do e-mail, como no exemplo abaixo:.
	anna5@contoso.com
	ID do email = anna5

Já a senha será o FirtName + o dia do ano em que o funcionário nasceu (DIA JULIANO), em MAIÚSCULA. Por exemplo, o funcionário com E-mail: anna5@contoso.com e data de nascimento 15/01/1990 deverá ter a seguinte senha:
	Login: anna5
	Senha: ANNA15

O responsável pelo TI pediu a sua ajuda para retornar uma tabela contendo as seguintes colunas da tabela DimEmployee: Nome completo (FirstName + LastName), E-mail, ID do e-mail e Senha.
Portanto, faça uma consulta à tabela DimProduct e retorne esse resultado.
***/

SELECT 
	FirstName,
	BirthDate,
	EmailAddress,
	LEFT(EmailAddress, CHARINDEX('@', EmailAddress)-1) AS Login,
	CONCAT(FirstName, (DATENAME(DAYOFYEAR, BirthDate))) AS Password
FROM DimEmployee;