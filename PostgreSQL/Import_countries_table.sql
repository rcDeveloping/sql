COPY countries
FROM 'D:\ssd_c\databases_bk\countries_tables\countries.csv'
WITH NULL AS 'NULL'
DELIMITER ';'
CSV HEADER;