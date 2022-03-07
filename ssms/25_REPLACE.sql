/**** REPLACE "AFG" with AFG in country_code column ******/

USE countries
GO

UPDATE populations
SET country_code = REPLACE(country_code, '"', '');