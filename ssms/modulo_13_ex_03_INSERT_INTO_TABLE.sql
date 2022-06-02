/*** Modulo 13 - CRUD - Ex. 03 ***/
USE Exercicios
GO

INSERT INTO dCliente
VALUES
	('André Martins', '1989-02-12'),
	('Bárbara Campos', '1992-05-07'),
	('Carol Freitas', '1985-04-23'),
	('Diego Cardoso', '1994-10-11'),
	('Eduardo Pereira', '1988-11-09'),
	('Fabiana Silva', '1989-09-02'),
	('Gustavo Barbalho', '1993-06-27'),
	('Helen Viana', '1990-02-11')
GO

INSERT INTO dGerente
VALUES
	('Lucas Sampaio', '2015-03-21', 6700),
	('Mariana Padilha', '2011-01-10', 9900),
	('Nathália Santos', '2018-10-03', 7200),
	('Otávio Costa', '2017-04-18', 7200)
GO

INSERT INTO fContratos
VALUES
	('2019-01-12', 8, 1, 23000),
	('2019-02-10', 3, 2, 15500),
	('2019-03-07', 7, 2, 6500),
	('2019-03-15', 1, 3, 33000),
	('2019-03-21', 5, 4, 11100),
	('2019-03-23', 4, 2, 5500),
	('2019-03-28', 8, 3, 55000),
	('2019-04-04', 2, 1, 31000),
	('2019-04-05', 8, 4, 3400),
	('2019-04-05', 6, 2, 9200);