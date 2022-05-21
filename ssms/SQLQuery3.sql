/****** A table of two cities ******/
/*
This exercise looks to explore languages potentially and most frequently spoken in the cities of Hyderabad, India and Hyderabad, Pakistan.
*/

-- Select fields
SELECT c.name AS city, l.name AS language
-- From cities (alias as c)
FROM cities AS c        
  -- Join to languages (alias as l)
  INNER JOIN languages AS l
    -- Match on country code
    ON c.country_code = l.code
-- Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%'
ORDER BY language;

/*
Outer challenge
Now that you're fully equipped to use OUTER JOINs, try a challenge problem to test your knowledge!

In terms of life expectancy for 2015, determine the names of the lowest five countries and their regions.
*/
-- Select fields
SELECT 
	-- Limit to 5 records
	TOP 5
	c.country_name AS country, 
	region, 
	FORMAT(life_expectancy, 'N') AS life_exp
-- From countries (alias as c)
FROM countries AS c
  -- Join to populations (alias as p)
	LEFT JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code
-- Focus on 2010
WHERE year = 2015 AND life_expectancy IS NOT NULL
-- Order by life_exp
ORDER BY life_expectancy;
