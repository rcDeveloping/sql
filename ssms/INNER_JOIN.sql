/*** inner join to find out the different currencies used in the countries of Oceania ***/

-- Select fields (with aliases)
SELECT c1.code, c1.country_name, basic_unit AS currency
  -- From countries (alias as c1)
  FROM countries AS c1
  	-- Join with currencies (alias as c2)
  	INNER JOIN currencies AS c2
    -- Match on code
    ON c1.code = c2.code
-- Where continent is Oceania
WHERE continent = 'Oceania';