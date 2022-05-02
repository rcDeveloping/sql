/*** IFNULL ***/
#
# A tabela lojas pode ter lojas que não possuem telefone de contato.
# Neste caso, todas as lojas que tiverem um telefone NULL, serão direcionadas para uma central de atendimento com um npúmero padrão 0800-999-9999.

USE base;

SELECT 
	*,
	IFNULL(Telefone, '0800-999-9999') AS Telefone2
FROM lojas;
