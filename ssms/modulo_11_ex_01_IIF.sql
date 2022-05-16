/*** M�DULO 11: EXERC�CIOS
1. O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O percentual aplicado dever� ser de:
Economy -> 5%
Regular -> 7%
Deluxe -> 9%
a) Fa�a uma consulta � tabela DimProduct que retorne as seguintes colunas: ProductKey, ProductName, e outras duas colunas que dever�o retornar o % de Desconto e UnitPrice com desconto.
b) Fa�a uma adapta��o no c�digo para que os % de desconto de 5%, 7% e 9% sejam facilmente modificados (dica: utilize vari�veis).
***/

DECLARE @EconomyOff FLOAT = 0.05;
DECLARE @RegularOff FLOAT = 0.07;
DECLARE @DeluxeOff FLOAT = 0.09;

SELECT
	ProductKey,
	ProductName,
	ProductDescription,
	ColorName,
	ClassName,
	UnitPrice,
		IIF(
		ClassName = 'Economy', @EconomyOff,
		IIF(ClassName = 'Regular', @RegularOff, @RegularOff)
	) AS Discount,
	IIF(
		ClassName = 'Economy', UnitPrice - ROUND((UnitPrice * @EconomyOff), 2),
		IIF(ClassName = 'Regular', UnitPrice - ROUND((UnitPrice * @RegularOff), 2),
			UnitPrice - ROUND((UnitPrice * @DeluxeOff), 2))
	) AS PriceOff
FROM DimProduct;