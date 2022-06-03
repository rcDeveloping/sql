/***
--> 4.
Novos dados deverão ser adicionados nas tabelas dCliente, dGerente e fContratos. Fique livre 
para adicionar uma nova linha em cada tabela contendo, respectivamente, 
(1) um novo cliente (id cliente, nome e data de nascimento)
(2) um novo gerente (id gerente, nome, data de contratação e salário)
(3) um novo contrato (id, data assinatura, id cliente, id gerente, valor do contrato
***/
USE Exercicios
GO

INSERT INTO dCliente
VALUES('Karina Maravalha', '1980-03-01')
GO

INSERT INTO dGerente
VALUES('Marcos Pedreira', '1981-12-31', 10900)
GO

INSERT INTO fContratos
VALUES('2020-03-30', 2, 8, 65000);