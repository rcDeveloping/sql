--M�DULO 3: EXERC�CIOS
/*
1. Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
O que voc� precisar� fazer � confirmar se:
a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.
b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse n�mero aumentou ou reduziu.
*/

--Existem 2.517 produtos cadastrados na base?
SELECT COUNT(ProductKey) FROM DimProduct;

--Verificar o n]umero de clientes
SELECT COUNT(DISTINCT CustomerKey) FROM DimCustomer;


-->>A empresa at� a data de consulta, possui 18.869 cientes cadastrados na base de dados, portanto, o n�mero de clientes reduziu.


/*
2. Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer descontos especiais para os clientes no dia de seus anivers�rios. Para isso, voc� vai precisar listar todos os clientes e as suas respectivas datas de nascimento, al�m de um contato.
a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/

SELECT
	CustomerKey AS id_Cliente,

	--Concatenar o primeiro nome com o sobrenome
	CONCAT(FirstName, ' ', LastName) AS Nome,
	
	--Converter a data para p formato dd/mm/aa
	CONVERT(varchar, BirthDate, 103)  AS Data_Aniversario

FROM dimCustomer

--Excluir da consulta os registros sem nome
WHERE FirstName IS NOT NULL;

/*
3. A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e pretende fazer uma a��o de premia��o para os clientes. A empresa quer presentear os primeiros clientes desde a inaugura��o.
Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras de R$ 1.000. Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).
b) A Contoso decidiu presentear os primeiros 10% de clientes da hist�ria com um vale compras de R$ 100. Utilize um comando em SQL para retornar 10% das linhas da sua tabela dimCustomer (selecione todas as colunas).
c) Renomeie as colunas anteriores para nomes em portugu�s.
*/

--100 primeiros clientes cadastrados
SELECT TOP 100
	CustomerKey AS id_Cliente,
	CONCAT(FirstName, ' ', LastName) AS Nome_Cliente,
	EmailAddress AS email,
	Phone AS Telefone,
	DateFirstPurchase AS Data_Cadastro
FROM DimCustomer
WHERE FirstName IS NOT NULL
ORDER BY DateFirstPurchase;

--10% clientes
SELECT TOP 10  PERCENT
	CustomerKey AS id_Cliente,
	CONCAT(FirstName, ' ', LastName) AS Nome_Cliente,
	EmailAddress AS email,
	Phone AS Telefone,
	DateFirstPurchase AS Data_Cadastro
FROM DimCustomer
WHERE FirstName IS NOT NULL
ORDER BY DateFirstPurchase;

/*
4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque. Voc� � da �rea de compras e precisa descobrir quem s�o esses fornecedores.
Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela dimProduct e renomeie essa nova coluna da tabela.
*/
SELECT DISTINCT Manufacturer AS Fornecedor 
FROM DimProduct;

 /*
 5. O seu trabalho de investiga��o n�o para. Voc� precisa descobrir se existe algum produto registrado na base de produtos que ainda n�o tenha sido vendido. Tente chegar nessa informa��o.
Obs: caso tenha algum produto que ainda n�o tenha sido vendido, voc� n�o precisa descobrir qual �. � suficiente saber se teve ou n�o algum produto que ainda n�o foi vendido.
*/
SELECT 
	DimProduct.ProductKey AS id_Produto,
	DimProduct.ProductName AS Nome_Produto,
	DimProduct.Manufacturer AS Fornecedor,
	DimProduct.AvailableForSaleDate AS Data_Entrada,
	FactSales.SalesKey AS id_venda
FROM DimProduct
LEFT JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey
WHERE FactSales.SalesKey IS NULL;
