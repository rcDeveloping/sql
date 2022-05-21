/*** MODULO 9 - EXERCICIO 3 ***/

/*
3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de usu�rios. Em resumo, esses dados s�o:
- Nome do usu�rio
- Data de nascimento
- Quantidade de pets que aquele usu�rio possui
Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este usu�rio. Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e num_pets. Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.
*/

DECLARE @nome VARCHAR(50) = 'Andr�', @data_nascimento DATETIME = '1988/10/02', @num_pets INT = 2

SELECT CONCAT('Meu nome � ', @nome, ',', ' nasci em ', FORMAT(@data_nascimento, 'dd/MM/yyyy'), ' e tenho ', @num_pets, ' pets.');