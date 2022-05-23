/*** Creating horizontal partitions ***/
-- Create a new table called film_partitioned
CREATE TABLE film_partitioned (
  id INT,
  title TEXT NOT NULL,
  release_year TEXT
)
PARTITION BY LIST (release_year);

-- Create the partitions for 2016, 2015, and 2014
CREATE TABLE film_2016
	PARTITION OF film_partitioned FOR VALUES IN ('2016');
    
CREATE TABLE film_2015
	PARTITION OF film_partitioned FOR VALUES IN ('2015');
    
CREATE TABLE film_2014
	PARTITION OF film_partitioned FOR VALUES IN ('2014');
    
-- Insert the data into film_partitioned
INSERT INTO film_partitioned
SELECT id, title, release_year FROM films WHERE release_year > 2013 AND release_year < 2017 AND release_year IS NOT NULL;

-- View film_partitioned
SELECT * FROM film_partitioned;