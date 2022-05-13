USE HashTag
GO

ALTER TABLE funcionarios
ADD cargo VARCHAR(100), bonus FLOAT
GO

UPDATE funcionarios
SET cargo = 'Analista', bonus = 0.15
WHERE id_funcionario = 1;