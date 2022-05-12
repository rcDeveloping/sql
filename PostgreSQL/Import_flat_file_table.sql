COPY cities
FROM 'D:\ssd_c\databases_bk\countries_tables\cities.csv' 
WITH NULL AS 'NULL' -- Need to import integer columns with NULL values
DELIMITER ';';
