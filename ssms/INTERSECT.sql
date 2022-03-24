/*
UNION ALL will extract all records from two tables, while INTERSECT will only return records that both tables have in common.
*/

USE countries;

-- Select fields
SELECT code, year 
-- From economies
FROM  economies
-- Set theory clause
INTERSECT	
-- Select fields
SELECT country_code, year
  -- From populations
FROM populations
-- Order by code and year
ORDER BY code, year;

/*
As you think about major world cities and their corresponding country, you may ask which countries also have a city with the same name as their country name?
*/

-- Select fields
SELECT country_name
  -- From countries
FROM countries
-- Set theory clause
INTERSECT 
-- Select fields
SELECT name
-- From cities
FROM cities;