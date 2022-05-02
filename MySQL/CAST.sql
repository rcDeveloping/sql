# CAST

# Converte um valor para outro tipo

-- obs: No CAST, especificar o INT como SIGNED ou UNSIGNED e o VARCHAR como CHAR.

SET @varNum = 10.9200;

SELECT @varNum,
	CAST(@varNum AS SIGNED),
    CAST(@varNum AS DECIMAL(10, 2)),
    CAST(@varNum AS CHAR(3));
    
SET @varDate = '2022-04-30';

SELECT @varDate,
	CAST(@varDate AS DATE),
    CAST(@varDate AS DATETIME);
