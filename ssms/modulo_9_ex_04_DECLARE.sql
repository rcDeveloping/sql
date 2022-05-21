/*** modulo 9 *- exercicio ***/

/*
4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as lojas da empresa.
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas
*/

DECLARE @nome_das_lojas VARCHAR(100);

SET @nome_das_lojas = '';

SELECT  @nome_das_lojas =  @nome_das_lojas + StoreName + ','
FROM DimStore WHERE YEAR(CloseDate) = 2008;

PRINT('As lojas fechadas no ano de 2008 foram: ' + @nome_das_lojas);