/*** IF ***/

# As lojas da empresa que tiverem mnais de 20 funcionários receberão reforma de ampliação.
# Utilizar a função IF apra criar uma coluna na tabela Lojas que informe quas lojas receberão reforma e quais não receberão.

USE base;

SELECT 
	ID_Loja,
    Loja,
    Gerente,
    Endereco,
    IF(Num_Funcionarios > 20, 'Reforma de Ampliação', 'Não Receberá Reforma')
    AS Reforma
FROM lojas;
