/****** Self-ish Joins ******/
USE leaders
GO

/*SELECT 
	p1.country AS Country1,
	p2.country AS Country2,
	p1.continent

FROM
	prime_ministers AS p1
INNER JOIN prime_ministers AS p2
	ON p1.continent = p2.continent;
*/

SELECT 
	p1.country AS Country1,
	p2.country AS Country2,
	p1.continent

FROM
	prime_ministers AS p1
INNER JOIN prime_ministers AS p2
	ON p1.continent = p2.continent AND p1.country <> p2.country;


/*
In this exercise, you'll use the "populations" table to perform a self-join to calculate the percentage increase in population from 2010 to 2015 for each country code!
Since you'll be joining the "populations" table to itself, you can alias populations as "p1" and also populations as "p2". This is good practice whenever you are aliasing and your tables have the same first letter. Note that you are required to alias the tables with self-joins.

--Instructions--
* Join "populations" with itself "ON" "country_code".
* Select the "country_code" from "p1" and the "size" field from both "p1" and "p2". SQL won't allow same-named fields, so alias "p1.size" as "size2010" and "p2.size" as "size2015".
*/
USE countries
GO

-- Select fields with aliases
SELECT 
	p1.country_code, 
	FORMAT(p1.size, 'N') AS size2010,
	FORMAT(p2.size, 'N') AS size2015

-- From populations (alias as p1)
FROM populations AS p1

  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2

    -- Match on country code
    ON p1.country_code = p2.country_code;

/*
* Notice from the result that for each "country_code" you have four entries laying out all combinations of 2010 and 2015.
* Extend the "ON" in your query to include only those records where the "p1.year" (2010) matches with "p2.year - 5" (2015 - 5 = 2010). This will omit the three entries per "country_code" that you aren't interested in.
*/
-- Select fields with aliases
SELECT p1.country_code,
       FORMAT(p1.size, 'N') AS size2010,
       FORMAT(p2.size, 'N') AS size2015

-- From populations (alias as p1)
FROM populations AS p1

  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2

    -- Match on country code
    ON p1.country_code = p2.country_code

        -- and year (with calculation)
        AND p1.year = p2.year - 5;

/*
* As you just saw, you can also use SQL to calculate values like "p2.year - 5" for you. With two fields like "size2010" and "size2015", you may want to determine the percentage increase from one field to the next:

With two numeric fields A and B, the percentage growth from A to B can be calculated as (B - A)/A * 100.0

* Add a new field to "SELECT", aliased as "growth_perc", that calculates the percentage population growth from 2010 to 2015 for each country, using "p2.size" and "p1.size".
*/
USE countries
GO

-- Select fields with aliases
SELECT p1.country_code,
       FORMAT(p1.size, 'N') AS size2010,
       FORMAT(p2.size, 'N') AS size2015,
       -- Calculate growth_perc
       ROUND(((p2.size - p1.size)*1.0/p1.size * 100.00),2) AS growth_perc
-- From populations (alias as p1)
FROM populations AS p1
  -- Join to itself (alias as p2)
  INNER JOIN populations AS p2
    -- Match on country code
    ON p1.country_code = p2.country_code
        -- and year (with calculation)
        AND p1.year = p2.year - 5;