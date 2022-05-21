/*** MODULO 9 - EXERCICIOS ***/

--2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser especificado.

--a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
DECLARE @produto VARCHAR(50) = 'Celular'

--b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
DECLARE @quantidade INT = 12

--c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
DECLARE @preco DECIMAL(18,2) = 9.99

--d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre ‘quantidade’ e ‘preco’.
DECLARE @faturamento DECIMAL(18, 2) = @quantidade * @preco

SELECT @faturamento AS faturamento;

--e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.
SELECT 
	@produto AS Produto,
	@quantidade AS quantidade,
	@preco AS 	preco,
	@faturamento AS faturamento;