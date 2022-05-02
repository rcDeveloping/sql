# LEFT and RIGHT

SET @My_Var = 'MySQL WorkBench';

SELECT
	LEFT(@My_Var, 5) AS 'LEFT',
    RIGHT(@My_Var, 9) AS 'RIGHT';