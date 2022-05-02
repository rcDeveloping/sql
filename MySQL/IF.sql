/*** IF ***/
# Exemplo: A empresa oferece um bônus de 10% e 5% para todos os funcionários que obtiveram avaliação do RH de acordo com a seguinte regra:
-- NotaDesempenho >= 7 ----> 10%
-- NotaDesempenho >= 5 ----> 5%
-- NotaDesempenho < 5 ----> 0%

SET @NotaDesempenho = 4;

SELECT
	IF(@NotaDesempenho >= 7, 'Bônus 10%',
		IF(@NotaDesempenho >= 5, 'Bônus 5%', 'Não Recebe Bônus')) 
	AS Bonus;