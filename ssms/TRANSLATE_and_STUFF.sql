/***TRANSLATE and STUFF***/

--TRANSLATE: Substitui cada caractere na ordem encontrada no texto

SELECT TRANSLATE('10.241/444.124K23/1', './K', '---');

--STUFF: Substitui qualquer texto com uma quantidade de caracteres limitados por um outro texto

SELECT STUFF('VBA Impressionador', 1, 3, 'Excel');