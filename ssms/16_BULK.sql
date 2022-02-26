USE leaders;
GO


CREATE TABLE presidents (
  country                 VARCHAR(50),
  continent               VARCHAR(50),
  president               VARCHAR(50)
);

GO


CREATE TABLE prime_ministers (
  country                 VARCHAR(50),
  continent               VARCHAR(50),
  prime_minister          VARCHAR(50)
);

GO 


CREATE TABLE states (
  name                    VARCHAR(50),
  continent               VARCHAR(50),
  indep_year              INTEGER,
  fert_rate               REAL,
  women_parli_perc        REAL
  
);

GO


CREATE TABLE monarchs (
  country                 VARCHAR(50)   PRIMARY KEY,
  continent               VARCHAR(50),
  monarch                 VARCHAR(50)
);

GO


/*** Import data from CSV ***/

-- A solution for
-- Msg 7301, Level 16, State 2, Line 58
-- Cannot obtain the required interface ("IID_IColumnsInfo") from OLE DB provider "BULK" for linked server "(null)".

DECLARE @row_terminator CHAR;
SET @row_terminator = CHAR(13); -- or char(10)

DECLARE @stmt NVARCHAR(2000);;
SET @stmt = '

	BULK INSERT dbo.presidents 
		FROM ''D:/presidents.csv'' 
			WITH 
					(
						FIRSTROW = 2,
						FIELDTERMINATOR = '','',
						ROWTERMINATOR='''+@row_terminator+'''
					)'
exec sp_executesql @stmt;

GO


DECLARE @row_terminator CHAR;
SET @row_terminator = CHAR(13); -- or char(10)

DECLARE @stmt NVARCHAR(2000);;
SET @stmt = '

	BULK INSERT dbo.monarchs 
		FROM ''D:/monarchs.csv'' 
			WITH 
					(
						FIRSTROW = 2,
						FIELDTERMINATOR = '','',
						ROWTERMINATOR='''+@row_terminator+'''
					)'
exec sp_executesql @stmt;

GO


DECLARE @row_terminator CHAR;
SET @row_terminator = CHAR(13); -- or char(10)

DECLARE @stmt NVARCHAR(2000);;
SET @stmt = '

	BULK INSERT dbo.prime_ministers 
		FROM ''D:/prime_ministers.csv'' 
			WITH 
					(
						FIRSTROW = 2,
						FIELDTERMINATOR = '','',
						ROWTERMINATOR='''+@row_terminator+'''
					)'
exec sp_executesql @stmt;

GO


DECLARE @row_terminator CHAR;
SET @row_terminator = CHAR(13); -- or char(10)

DECLARE @stmt NVARCHAR(2000);;
SET @stmt = '

	BULK INSERT dbo.states 
		FROM ''D:/states.csv'' 
			WITH 
					(
						FIRSTROW = 2,
						FIELDTERMINATOR = '','',
						ROWTERMINATOR='''+@row_terminator+'''
					)'
exec sp_executesql @stmt;