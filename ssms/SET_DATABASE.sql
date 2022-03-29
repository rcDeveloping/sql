/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) 
	name,
	country_code,
    city_proper_pop,
    metroarea_pop,
    urbanarea_pop
  FROM countries.dbo.cities;


--The same query
USE countries;

SELECT TOP (1000) 
	name,
	country_code,
    city_proper_pop,
    metroarea_pop,
    urbanarea_pop
  FROM cities;