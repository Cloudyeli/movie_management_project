### * Delete existing Tables
### * Create new Database movie_db
### * Create new table directors_tbl
### * Create new table movies_tbl
### * Create new table main_actors_tbl
### * Create new table movie_actors_tbl
### running the whole file
### source <~/src/Talent-Academy/filename>

### Delete Table
#DROP TABLE movie_actors_tbl;
#DROP TABLE main_actors_tbl;
#DROP TABLE movies_tbl;
#DROP TABLE directors_tbl;

### Create a new database
CREATE DATABASE movie_db;

### Show all database
SHOW DATABASES;

### Use our new database
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
    "Chloe Zhaos",
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
(null, "Zoe Saldaña",1978,"f"),
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
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Zoe Saldaña%")
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