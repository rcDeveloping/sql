/*** M�dulo 15 - Exerc�cios
3. Utilize um Loop While para criar uma tabela chamada Calendario, contendo uma coluna que comece com a data 01/01/2021 e v� at� 31/12/2021.
***/
USE Exercicios;
GO

DROP TABLE IF EXISTS Calendario;
GO

CREATE TABLE Calendario(Data DATE);
GO

DECLARE @DataInicial DATETIME = '2021-01-01'
DECLARE @DataFinal DATETIME = '2021-12-31'

WHILE @DataInicial <= @DataFinal
BEGIN 
	INSERT INTO Calendario(Data)
	VALUES(@DataInicial)
	SET @DataInicial = DATEADD(DAY, 1, @DataInicial)
END

SELECT * FROM Calendario;