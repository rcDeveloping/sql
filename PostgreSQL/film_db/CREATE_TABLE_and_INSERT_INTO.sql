CREATE TABLE films (
  id                    INTEGER     PRIMARY KEY,
  title                 VARCHAR,
  release_year          INTEGER,
  country               VARCHAR,
  duration              INTEGER,
  language              VARCHAR,
  certification         VARCHAR,
  gross                 BIGINT,
  budget                BIGINT
);

CREATE TABLE people (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  birthdate             DATE,
  deathdate             DATE
);

CREATE TABLE reviews (
  id                    INTEGER     PRIMARY KEY,
  film_id               INTEGER,
  num_user              INTEGER,
  num_critic            INTEGER,
  imdb_score            REAL,
  num_votes             INTEGER,
  facebook_likes        INTEGER
);

CREATE TABLE roles (
  id                    INTEGER     PRIMARY KEY,
  film_id               INTEGER,
  person_id             INTEGER,
  role                  VARCHAR
);

-- Copy over data from CSVs
copy films FROM 'D:\ssd_c\databases_bk\mssms\film\films.csv' DELIMITER ',' CSV HEADER;
copy people FROM 'D:\ssd_c\databases_bk\mssms\film\people.csv' DELIMITER ',' CSV HEADER;
copy reviews FROM 'D:\ssd_c\databases_bk\mssms\film\reviews.csv' DELIMITER ',' CSV HEADER;
copy roles FROM 'D:\ssd_c\databases_bk\mssms\film\roles.csv' DELIMITER ',' CSV HEADER;