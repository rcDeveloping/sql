/****** BULK INSERT FROM CSV FILE ******/

USE countries
GO

DELETE FROM populations;

BULK INSERT populations
FROM 'D:/populations.csv'
WITH (FORMAT = 'CSV'
      , FIRSTROW=2
      , FIELDQUOTE = '\'
      , FIELDTERMINATOR = ','
      , ROWTERMINATOR = '0x0a');
SELECT * FROM populations;