/****** EXCEPT ******/

-->Get the names of cities in cities table which are not noted as capital cities in countries table as a single field result.

-- Select field
SELECT name
-- From cities
FROM cities
-- Set theory clause to determine the names of cities that are not listed in the countries table.
EXCEPT
-- Select field
SELECT country_name
-- From countries
FROM countries
-- Order by result
ORDER BY name;


-->Determine the names of capital cities that are not listed in the cities table.

-- Select field
SELECT capital
-- From countries
FROM countries
-- Set theory clause
EXCEPT
-- Select field
SELECT name
-- From cities
FROM cities
-- Order by ascending capital
ORDER BY capital;