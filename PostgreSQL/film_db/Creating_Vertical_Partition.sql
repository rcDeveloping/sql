/*** Creating vertical partitions ***/
-- Create a new table called certifications
CREATE TABLE film_certifications (
    id INT,
    certification TEXT
);

-- Copy the certifications from the film table
INSERT INTO film_certifications
SELECT id, certification FROM films;

-- Drop the column in the original table
--ALTER TABLE films DROP COLUMN certification;

-- Join to create the original table
SELECT * FROM films 
JOIN film_certifications USING(id);