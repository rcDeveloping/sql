/****** PRINT function ******/

/*
EX.1: Print out on screen the total of store "On" and "Off" from the DimStore table. 
Use variables to do it.
*/

SET NOCOUNT ON  -- Hide the "(1 row affected)" int the Messages tab.

DECLARE @varStoreOn INT, @varStoreOff INT
SET @varStoreOn = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On')
SET @varStoreOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')

SELECT
	@varStoreOn AS Store_On,
	@varStoreOff AS Store_Off

PRINT 'The Total of Open Store is ' + CAST(@varStoreOn AS VARCHAR(10)) + '.'
PRINT 'The Total of Off Store is ' + CAST(@varStoreOff AS VARCHAR(10)) + '.'