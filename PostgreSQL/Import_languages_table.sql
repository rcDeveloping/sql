COPY languages
FROM 'D:\ssd_c\databases_bk\countries_tables\languages.csv'
WITH NULL AS 'NULL'
DELIMITER ';'
CSV HEADER;