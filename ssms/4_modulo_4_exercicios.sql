--M�DULO 4: EXERC�CIOS

/*
1. Voc� � o gerente da �rea de compras e precisa criar um relat�rio com as TOP 100 vendas, de acordo com a quantidade vendida. Voc� precisa fazer isso em 10min pois o diretor de compras solicitou essa informa��o para apresentar em uma reuni�o.
Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de acordo com o total vendido (SalesAmount).
*/
SELECT TOP 100 *
FROM FactSales
ORDER BY SalesAmount DESC;

/*
2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo pre�o. Por�m, a empresa quer diferenciar esses pre�os de acordo com o peso (Weight) de cada um.
O que voc� precisar� fazer � ordenar esses top 10 produtos, de acordo com a coluna de UnitPrice e, al�m disso, estabelecer um crit�rio de desempate, para que seja mostrado na ordem, do maior para o menor.
Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar um segundo crit�rio de desempate (al�m do peso).
*/
SELECT TOP 10 *
FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC;

/*
3. Voc� � respons�vel pelo setor de log�stica da empresa Contoso e precisa dimensionar o transporte de todos os produtos em categorias, de acordo com o peso.
Os produtos da categoria A, com peso acima de 100kg, dever�o ser transportados na primeira leva.
Fa�a uma consulta no banco de dados para descobrir quais s�o estes produtos que est�o na categoria A.
a) Voc� dever� retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.
b) Renomeie essas colunas com nomes mais intuitivos.
c) Ordene esses produtos do mais pesado para o mais leve.
*/
/*
DECLARE @Peso_KG FLOAT(8);

SELECT 
	ProductName AS Nome_Porduto,
	ROUND(CASE WHEN (WeightUnitMeasureID = 'pounds') THEN (Weight * 0.453592)
		WHEN (WeightUnitMeasureID = 'ounces') THEN (Weight * 0.0283495)
		END,2) AS Peso_KG
FROM DimProduct
WHERE (Peso_KG > 100.00)
ORDER BY Peso_KG DESC;
*/

SELECT 
	ProductName AS Nome_Porduto,
	Weight as Peso
FROM DimProduct
WHERE Weight > 100
ORDER BY Weight DESC;



/*
4. Voc� foi alocado para criar um relat�rio das lojas registradas atualmente na Contoso.
a) Descubra quantas lojas a empresa tem no total. Na consulta que voc� dever� fazer � tabela DimStore, retorne as seguintes informa��es: StoreName, OpenDate, EmployeeCount
b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.
c) Dessas lojas, descubra quantas (e quais) lojas ainda est�o ativas.
*/
SELECT COUNT(StoreKey) FROM DimStore; -- 306 LOJAS

SELECT 
	StoreName as Nome_Loja,
	OpenDate AS Data_Abertura, 
	EmployeeCount AS Num_Empregados
FROM DimStore
ORDER BY StoreName;

--c) LOJAS AINDA ATIVAS
SELECT 
	StoreName as Nome_Loja,
	OpenDate AS Data_Abertura, 
	EmployeeCount AS Num_Empregados
FROM DimStore
WHERE Status = 'On' AND StoreType = 'Store'
ORDER BY StoreName;


/*
5. O gerente da �rea de controle de qualidade notificou � Contoso que todos os produtos Home Theater da marca Litware, disponibilizados para venda no dia 15 de mar�o de 2009, foram identificados com defeitos de f�brica.
O que voc� dever� fazer � identificar os ID�s desses produtos e repassar ao gerente para que ele possa notificar as lojas e consequentemente solicitar a suspens�o das vendas desses produtos.
*/
SELECT 
	ProductKey AS id_Prdoduto, 
	ProductName AS Nome_Produto 
FROM DimProduct
WHERE BrandName = 'Litware' AND AvailableForSaleDate = '2009-03-15' AND ProductName LIKE '%Home Theater%';


/*
6. Imagine que voc� precise extrair um relat�rio da tabela DimStore, com informa��es de lojas. Mas voc� precisa apenas das lojas que n�o est�o mais funcionando atualmente.
a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que n�o est�o mais funcionando.
b) Agora imagine que essa coluna de Status n�o existe na sua tabela. Qual seria a outra forma que voc� teria de descobrir quais s�o as lojas que n�o est�o mais funcionando?
*/
--A) LOJAS QUE FECHARAM
SELECT 
	StoreName as Nome_Loja,
	CloseDate AS Data_Encerramento, 
	EmployeeCount AS Num_Empregados
FROM DimStore
WHERE Status = 'Off'
ORDER BY StoreName;

--B)
SELECT 
	StoreName as Nome_Loja,
	CloseDate AS Data_Encerramento, 
	EmployeeCount AS Num_Empregados
FROM DimStore
WHERE CloseDate IS NOT NULL
ORDER BY StoreName;


/*
7. De acordo com a quantidade de funcion�rios, cada loja receber� uma determinada quantidade de m�quinas de caf�. As lojas ser�o divididas em 3 categorias:
CATEGORIA 1: De 1 a 20 funcion�rios -> 1 m�quina de caf�
CATEGORIA 2: De 21 a 50 funcion�rios -> 2 m�quinas de caf�
CATEGORIA 3: Acima de 51 funcion�rios -> 3 m�quinas de caf�
Identifique, para cada caso, quais s�o as lojas de cada uma das 3 categorias acima (basta fazer uma verifica��o). 
*/
SELECT 
	StoreName as Nome_Loja,
	EmployeeCount AS Num_Empregados,
	AddressLine1 AS Endereco,
	CASE WHEN EmployeeCount <= 20 THEN 1
		WHEN EmployeeCount BETWEEN 21 AND 50 THEN 2
		ELSE 3
		END AS Num_Maquinas_Cafe
FROM DimStore
ORDER BY StoreName;


/*
8. A empresa decidiu que todas as televis�es de LCD receber�o um super desconto no pr�ximo m�s. O seu trabalho � fazer uma consulta � tabela DimProduct e retornar os ID�s, Nomes e Pre�os de todos os produtos LCD existentes.
*/
SELECT 
	ProductKey AS id_Produto,
	ProductName AS Nome_Produto,
	UnitPrice AS Preco
FROM DimProduct
WHERE ProductName LIKE '%LCD%TV%'
/*
9. Fa�a uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. Estes produtos devem ser exclusivamente das marcas: Contoso, Litware e Fabrikam.
*/
SELECT 
	ProductKey AS id_Produto,
	ProductName AS Nome_Produto,
	BrandName AS Marca,
	ColorName AS Cor,
	UnitPrice AS Preco
FROM DimProduct
WHERE BrandName IN ('Contoso', 'Litware', 'Fabrikam')
	AND ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink')

ORDER BY --ORDENAR O PRECO DE ACORDO COM A MARCA
	CASE WHEN BrandName = 'Contoso' THEN UnitPrice END DESC,
		CASE WHEN BrandName = 'Litware' THEN UnitPrice END DESC,
		CASE WHEN BrandName = 'Fabrikam' THEN UnitPrice 
	END DESC

/*
10. A empresa possui 16 produtos da marca Contoso, da cor Silver e com um UnitPrice entre 10 e 30. Descubra quais s�o esses produtos e ordene o resultado em ordem decrescente de acordo com o pre�o (UnitPrice).
*/
SELECT 
	ProductKey AS id_Produto,
	ProductName AS Nome_Produto,
	BrandName AS Marca,
	ColorName AS Cor,
	UnitPrice AS Preco
FROM DimProduct
WHERE UnitPrice BETWEEN 10 AND 30 AND ColorName = 'Silver' AND BrandName = 'Contoso'
ORDER BY UnitPrice DESC;
