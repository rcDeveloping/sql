create database HashTag
GO

USE HashTag
GO

CREATE TABLE funcionarios(
    id_funcionario INT,
    nome_funcionario VARCHAR(100),
    salario FLOAT,
    data_nascimento DATETIME

)
GO


INSERT INTO funcionarios(id_funcionario, nome_funcionario, salario, data_nascimento)

VALUES
    (1, 'Lucas Alves', 1500, '1990/03/20'),
    (2, 'Andressa Cohen', 2300, '1988/12/07'),
    (3, 'Felipe Feo', 4000, '1993/02/13'),
    (4, 'Marcelo Campos', 7100, '1993/04/10'),
    (5, 'Carla Oliveira', 3200, '1986/09/02'),
    (6, 'Juliana Prestes', 5500, '1989/01/21'),
    (7, 'Mateus Fernandes', 1900, '1993/11/02'),
    (8, 'Sandra Bala', 3900, '1990/05/09'),
    (9, 'André Conrado', 1000, '1994/03/13'),
    (10, 'Julio Mascarenhas', 4700, '1992/07/05')
GO

SELECT * FROM funcionarios;