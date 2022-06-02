DELETE FROM dGerente
GO

-- SET IDENTITY_INSERT to ON.  
SET IDENTITY_INSERT dGerente ON
GO

INSERT INTO dGerente(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
	(1, 'Lucas Sampaio', '2015-03-21', 6700),
	(2, 'Mariana Padilha', '2011-01-10', 9900),
	(3, 'Nathália Santos', '2018-10-03', 7200),
	(4, 'Otávio Costa', '2017-04-18', 7200)