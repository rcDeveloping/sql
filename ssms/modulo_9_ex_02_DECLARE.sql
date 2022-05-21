/*** MODULO 9 - EXERCICIOS ***/

--2. Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser especificado.

--a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.
DECLARE @produto VARCHAR(50) = 'Celular'

--b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12.
DECLARE @quantidade INT = 12

--c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.
DECLARE @preco DECIMAL(18,2) = 9.99

--d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre �quantidade� e �preco�.
DECLARE @faturamento DECIMAL(18, 2) = @quantidade * @preco

SELECT @faturamento AS faturamento;

--e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.
SELECT 
	@produto AS Produto,
	@quantidade AS quantidade,
	@preco AS 	preco,
	@faturamento AS faturamento;