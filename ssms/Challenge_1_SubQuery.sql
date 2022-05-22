/*
In this exercise, you'll need to get the country names and other 2015 data in the economies table and the countries table for Central American countries with an official language.

Select unique country names. Also select the total investment and imports fields.
Use a left join with countries on the left. (An inner join would also work, but please use a left join here.)
Match on code in the two tables AND use a subquery inside of ON to choose the appropriate languages records.
Order by country name ascending.
Use table aliasing but not field aliasing in this exercise.
*/

USE countries
GO

-- Select fields
SELECT DISTINCT country_name, economies.total_investment, economies.imports
  -- From table (with alias)
  FROM countries
    -- Join with table (with alias)
    LEFT JOIN economies
      -- Match on code
      ON (countries.code = economies.code
      -- and code in Subquery
        AND countries.code IN (
          SELECT l.code
          FROM languages AS l
          WHERE official = 'true'
        ) )
  -- Where region and year are correct
  WHERE region = 'Central America' AND year = 2015
-- Order by field
ORDER BY country_name;