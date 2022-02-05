--MÓDULO 3: EXERCÍCIOS
/*
1. Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:
a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.
b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse número aumentou ou reduziu.
*/

--Existem 2.517 produtos cadastrados na base?
SELECT COUNT(ProductKey) FROM DimProduct;

--Verificar o n]umero de clientes
SELECT COUNT(DISTINCT CustomerKey) FROM DimCustomer;


-->>A empresa até a data de consulta, possui 18.869 cientes cadastrados na base de dados, portanto, o número de clientes reduziu.


/*
2. Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.
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
3. A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde a inauguração.
Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras de R$ 1.000. Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).
b) A Contoso decidiu presentear os primeiros 10% de clientes da história com um vale compras de R$ 100. Utilize um comando em SQL para retornar 10% das linhas da sua tabela dimCustomer (selecione todas as colunas).
c) Renomeie as colunas anteriores para nomes em português.
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
4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque. Você é da área de compras e precisa descobrir quem são esses fornecedores.
Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela dimProduct e renomeie essa nova coluna da tabela.
*/
SELECT DISTINCT Manufacturer AS Fornecedor 
FROM DimProduct;

 /*
 5. O seu trabalho de investigação não para. Você precisa descobrir se existe algum produto registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa informação.
Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir qual é. É suficiente saber se teve ou não algum produto que ainda não foi vendido.
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
