/*** Modulo 13 - CRUD 
--> 1. 
a) Crie um banco de dados chamado BD_Teste.
b) Exclua o banco de dados criado no item anterior.
c) Crie um banco de dados chamado Exercicios.
***/

CREATE DATABASE BD_Teste
GO

DROP DATABASE BD_Teste
GO

CREATE DATABASE Exercicios;
GO
/***
--> 2.
2. No banco de dados criado no exercício anterior, crie 3 tabelas, cada uma contendo as seguintes 
colunas:
Tabela 1: dCliente
- ID_Cliente
- Nome_Cliente
- Data_de _Nascimento
Tabela 2: dGerente
- ID_Gerente
- Nome_Gerente
- Data_de_Contratacao
- Salario
Tabela 3: fContratos
- ID_Contrato
- Data_de_Assinatura
- ID_Cliente
- ID_Gerente
- Valor_do_Contrato

--Lembre-se dos seguintes pontos:
a) Garantir que o Banco de Dados Exercicios está selecionado.
b) Definir qual será o tipo de dados mais adequado para cada coluna das tabelas. Lembrando que 
os tipos de dados mais comuns são: INT, FLOAT, VARCHAR e DATETIME.
Por fim, faça um SELECT para visualizar cada tabela.
***/
USE Exercicios
GO

DROP TABLE IF EXISTS dCliente
GO

CREATE TABLE dCliente (
	ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
	Nome_Cliente VARCHAR(255),
	Data_de_Nascimento DATETIME
);
GO

DROP TABLE IF EXISTS dGerente
GO

CREATE TABLE dGerente (
	ID_Gerente INT IDENTITY(1,1) PRIMARY KEY,
	Nome_Gerente VARCHAR(255),
	Data_de_Contratacao DATETIME,
	Salario FLOAT
);
GO

DROP TABLE IF EXISTS fContratos
GO

CREATE TABLE fContratos (
	ID_Contrato INT IDENTITY(1,1) PRIMARY KEY,
	Data_de_Assinatura DATETIME,
	ID_Cliente INT FOREIGN KEY REFERENCES  dCliente (ID_Cliente),
	ID_Gerente INT FOREIGN KEY REFERENCES dGerente (ID_Gerente),
	Valor_do_Contrato FLOAT
);
GO

SELECT * FROM dCliente;
GO
SELECT * FROM dGerente;
GO
SELECT * FROM fContratos;