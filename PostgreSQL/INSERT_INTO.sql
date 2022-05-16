INSERT INTO alunos(ID_Aluno, Nome_Aluno, Email)
VALUES
	(1, 'Ana Banzé', 'ana123@gmail.com'),
	(2, 'Bruno Cavalcante', 'bruno_vant@yahoo.com.br'),
	(3, 'Carla Lousada', 'carla1990@outlook.com'),
	(4, 'Diego Sobral', 'di_sobra@hotmail.com');
	
INSERT INTO cursos(ID_Curso, Nome_Curso, Preco_Curso)
VALUES
	(1, 'Excel', 100.00),
	(2, 'VBA', 150),
	(3, 'SQL', 300),
	(4, 'Python', 350),
	(5, 'C', 300),
	(6, 'JavaScript', 150);
	
INSERT INTO matriculas(ID_Matricula, ID_Aluno, ID_Curso, Data_Cadastro)
VALUES
	(1, 1, 1, '2021/03/11'),
	(2, 1, 2, '2021/03/21'),
	(3, 2, 3, '2021/01/08'),
	(4, 3, 1, '2021/04/03'),
	(5, 4, 1, '2021/05/10'),
	(6, 4, 3, '2021/05/10'),
	(7, 1, 6, '2022/01/23'),
	(8, 1, 5, '2022/01/23'),
	(9, 4, 4, '2022/05/10')