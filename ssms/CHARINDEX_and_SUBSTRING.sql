/****** SUBSTRING and CHARINDEX ******/

--Extrair de forma automatica quaisquer sobrenomes
DECLARE @name VARCHAR(255) = 'BERNARDO CAVALCANTE';

SELECT CHARINDEX(' ', @name);

SELECT SUBSTRING(@name, CHARINDEX(' ', @name) + 1, 255);