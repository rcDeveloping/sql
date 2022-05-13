CREATE TABLE alunos(
	ID_aluno INT,
	Nome_Aluno VARCHAR(100),
	Email VARCHAR(100)
);

CREATE TABLE cursos(
	ID_curso INT,
	Nome_Curso VARCHAR(100),
	Preco_Curso NUMERIC(10, 2)
);

CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT,
	ID_Curtso INT,
	Data_Cadastro DATE
);