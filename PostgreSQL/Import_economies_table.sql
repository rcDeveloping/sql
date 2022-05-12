COPY economies
FROM 'D:\ssd_c\databases_bk\countries_tables\economies.csv'
WITH NULL AS 'NULL'
DELIMITER ';'
CSV HEADER;