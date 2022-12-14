# Delete Table
DROP TABLE movie_actors_tbl
DROP TABLE directors_tbl
DROP TABLE main_actors_tbl
DROP TABLE movies_tbl

# Create a new database
CREATE DATABASE movie_db;

# Show all database
SHOW DATABASES;

# Use our new database
USE movie_db;

# Show existing Tables
SHOW TABLES;

#Create table directors
CREATE TABLE directors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int ,
    PRIMARY KEY (id)
);

# Get information about the table
# DESCRIBE <Talbe_name>
DESCRIBE directors_tbl;

# Add a new entry to the table
INSERT INTO directors_tbl VALUES(
    null,
    "James Cameron",
    1954
);
INSERT INTO directors_tbl VALUES(
    null,
    "Christopher Nolan",
    1970
);
INSERT INTO directors_tbl VALUES(
    null,
    "Patty Jenkins",
    1971
);
INSERT INTO directors_tbl VALUES(
    null,
    "Chloe Zhaos"
    1982
);


# Show all data from table
# SELECT
# FROM
# <WHERE>
SELECT * FROM directors_tbl;

# Create our Movie table
CREATE TABLE movies_tbl(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int ,
    director_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (DIRECTOR_ID) REFERENCES directors_tbl(id)
);

# Add new movie in Movie table
INSERT INTO movies_tbl VALUES(
    null,
    "Titanic",
    1997,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);

# Insert more then one Movie at once
INSERT INTO movies_tbl VALUES
    (null,"Titanic",1997,(SELECT id FROM directors_tbl WHERE name like "James Cameron")),
    (null,"Wonder Woman",2017,(SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")),
    (null,"Avatar",2009,(SELECT id FROM directors_tbl WHERE name like "James Cameron")),
    (null,"Aliens",1986,(SELECT id FROM directors_tbl WHERE name like "James Cameron")),
    (null,"Inception",2010,(SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")),
    (null,"Terminator",1984,(SELECT id FROM directors_tbl WHERE name like "James Cameron")),
    (null,"Cleopatra",2023,(SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")),
    (null,"Eternals",2021,(SELECT id FROM directors_tbl WHERE name like "Chloe Zhaos")),
    (null,"The Dark Knight",2008,(SELECT id FROM directors_tbl WHERE name like "Christopher Nolan"));

# Update an existing data in the table
UPDATE directors_tbl
SET name = "James Cameron"
WHERE  id = 1;

#Select from multiple Tables SELECT *
SELECT * 
FROM movies_tbl 
    JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id
WHERE movies_tbl.title LIKE "Inception";


# Create Actors table
CREATE TABLE main_actors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    sex varchar(1),
    PRIMARY KEY (id)
);

INSERT INTO main_actors_tbl VALUES
(null, "Arnold Schwarzenegger",1947,"m"),
(null, "Gal Gadot",1987,"f"),
(null, "Sigourney Weaver",1949,"f"),
(null, "Christian Bale", 1974,"m"),
(null, "Leonardo DiCaprio", 1974,"m"),
(null, "Angelina Jolie",1975,"f"),
(null, "Zoe Salda??a",1978,"f"),
(null, "Gemma Chan",1982,"f");

# Create your Movie-Actors table
CREATE TABLE movie_actors_tbl(
    movie_id int NOT NULL,
    main_actor_id int NOT NULL,
    PRIMARY KEY (movie_id, main_actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies_tbl(id),
    FOREIGN KEY (main_actor_id) REFERENCES main_actors_tbl(id)
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Avatar%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Zoe Salda??a%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%The Dark Knight%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Christian Bale%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Inception%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Leonardo DiCaprio%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Eternals%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Angelina Jolie%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Aliens%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Sigourney Weaver%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Cleopatra%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gal Gadot%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Eternals%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gemma Chan%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Titanic%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Leonardo DiCaprio%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Wonder Woman%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gal Gadot%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Terminator%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Arnold Schwarzenegger%")
);
INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "%Avatar%"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Sigourney Weaver%")
);



SELECT movies_tbl.title, main_actors_tbl.name
FROM movies_tbl
    JOIN movie_actors_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
    JOIN main_actors_tbl ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE movies_tbl.title LIKE "Avatar";

# UPDATE movies_tbl SET title = "Avatar" WHERE id = 13;
# DELETE FROM movies_tbl WHERE id = 11;
# SELECT * FROM <table_name>


SELECT *
FROM movies_tbl
WHERE title LIKE "T%";

SELECT COUNT(*)
FROM movies_tbl
WHERE title LIKE "T%";

SELECT *
FROM movies_tbl
ORDER BY release_year ASC;

SELECT *
FROM movies_tbl
ORDER BY release_year DESC;

SELECT title, release_year
FROM movies_tbl;

# running the whole file
# source <~/src/Talent-Academy/filename>

# List all the actors born before 1980.
SELECT name
FROM main_actors_tbl
WHERE year_of_birth < 1980;

# How many movies did Nolan direct ?
SELECT COUNT(*)
FROM movies_tbl
    JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id
WHERE directors_tbl.name LIKE "%Christopher Nolan%";

Among all the movies of James Cameron, how many were female actors ?

SELECT COUNT(DISTINCT main_actors_tbl.name)
FROM directors_tbl
    JOIN movies_tbl ON movies_tbl.director_id = directors_tbl.id
    JOIN movie_actors_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
    JOIN main_actors_tbl ON movie_actors_tbl.main_actor_id = main_actors_tbl.id
WHERE directors_tbl.name LIKE "%James Cameron%" AND main_actors_tbl.sex LIKE "f";

How many directors did Leonardo DiCaprio worked with ?

SELECT COUNT(DISTINCT directors_tbl.name)
FROM main_actors_tbl
    JOIN movie_actors_tbl ON movie_actors_tbl.main_actor_id = main_actors_tbl.id
    JOIN movies_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
    JOIN directors_tbl ON directors_tbl.id = movies_tbl.director_id
WHERE main_actors_tbl.name LIKE "%Leonardo DiCaprio%";

Who is the oldest director ?

SELECT *
FROM directors_tbl
WHERE year_of_birth = (SELECT min(year_of_birth) FROM directors_tbl);

What is the earliest movie of the oldest director ?

SELECT *
FROM movies_tbl
JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id
WHERE year_of_birth = (SELECT min(year_of_birth) FROM directors_tbl)
ORDER BY movies_tbl.release_year DESC
LIMIT 1;


What is the latest movie of the youngest actor ?

SELECT title, release_year, main_actors_tbl.name, main_actors_tbl.year_of_birth
FROM movies_tbl
JOIN movie_actors_tbl ON movie_actors_tbl.movie_id = movies_tbl.id
JOIN main_actors_tbl ON movie_actors_tbl.main_actor_id = main_actors_tbl.id
WHERE year_of_birth = (SELECT max(year_of_birth) FROM main_actors_tbl)
ORDER BY movies_tbl.release_year DESC
LIMIT 1;


# Change Value
SELECT name, year_of_birth
FROM main_actors_tbl
WHERE id = 4;
UPDATE main_actors_tbl
SET year_of_birth = 1974
WHERE id = 4;
