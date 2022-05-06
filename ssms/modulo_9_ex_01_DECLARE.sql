/*** Modulo 9 - Exercicios ***/

--1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:
DECLARE @valor1 INT = 10, @valor2 INT = 5,  @valor3 INT = 34, @valor4 INT = 7

--a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame essa vari�vel de soma.
DECLARE @soma INT
SET @soma = @valor1 + @valor2

SELECT @soma AS soma;

--b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4. Chame essa vari�vel de subtracao.
DECLARE @subtracao INT
SET @subtracao = @valor3 - @valor4

SELECT @subtracao AS subtracao;

--c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o valor4. Chame essa vari�vel de multiplicacao.
DECLARE @multiplicacao INT
SET @multiplicacao = @valor1 * @valor4

SELECT @multiplicacao AS multiplicacao;

--d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor4 pelo valor3. Chame essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.
DECLARE @divisao DECIMAL(18, 4)
SET @divisao = CAST(@valor4 AS FLOAT) /  @valor3

SELECT @divisao AS divisao;

--e) Arredonde o resultado da letra d) para 2 casas decimais.
SELECT ROUND(@divisao, 2) AS divisao;