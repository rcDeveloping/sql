/*** MODULO 9 - EXERCICIO 3 ***/

/*
3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
*/

DECLARE @nome VARCHAR(50) = 'André', @data_nascimento DATETIME = '1988/10/02', @num_pets INT = 2

SELECT CONCAT('Meu nome é ', @nome, ',', ' nasci em ', FORMAT(@data_nascimento, 'dd/MM/yyyy'), ' e tenho ', @num_pets, ' pets.');