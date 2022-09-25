# List all the actors born before 1980.
SELECT name
FROM main_actors_tbl
WHERE year_of_birth < 1980;
+-----------------------+
| name                  |
+-----------------------+
| Arnold Schwarzenegger |
| Sigourney Weaver      |
| Christian Bale        |
| Leonardo DiCaprio     |
| Angelina Jolie        |
| Zoe Saldaña           |
+-----------------------+

# How many movies did Nolan direct ?
SELECT COUNT(*)
FROM movies_tbl
    JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id
WHERE directors_tbl.name LIKE "%Christopher Nolan%";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+


# Among all the movies of James Cameron, how many were female actors ?
SELECT COUNT(DISTINCT main_actors_tbl.name)
FROM directors_tbl
    JOIN movies_tbl ON movies_tbl.director_id = directors_tbl.id
    JOIN movie_actors_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
    JOIN main_actors_tbl ON movie_actors_tbl.main_actor_id = main_actors_tbl.id
WHERE directors_tbl.name LIKE "%James Cameron%" AND main_actors_tbl.sex LIKE "f";
+--------------------------------------+
| COUNT(DISTINCT main_actors_tbl.name) |
+--------------------------------------+
|                                    2 |
+--------------------------------------+

# How many directors did Leonardo DiCaprio worked with ?
SELECT COUNT(DISTINCT directors_tbl.name)
FROM main_actors_tbl
    JOIN movie_actors_tbl ON movie_actors_tbl.main_actor_id = main_actors_tbl.id
    JOIN movies_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
    JOIN directors_tbl ON directors_tbl.id = movies_tbl.director_id
WHERE main_actors_tbl.name LIKE "%Leonardo DiCaprio%";
+------------------------------------+
| COUNT(DISTINCT directors_tbl.name) |
+------------------------------------+
|                                  2 |
+------------------------------------+

# Who is the oldest director ?
SELECT *
FROM directors_tbl
WHERE year_of_birth = (SELECT min(year_of_birth) FROM directors_tbl);
+----+---------------+---------------+
| id | name          | year_of_birth |
+----+---------------+---------------+
|  1 | James Cameron |          1954 |
+----+---------------+---------------+

# What is the earliest movie of the oldest director ?
SELECT *
FROM movies_tbl
    JOIN directors_tbl ON movies_tbl.director_id = directors_tbl.id
WHERE year_of_birth = (SELECT min(year_of_birth) FROM directors_tbl)
ORDER BY movies_tbl.release_year DESC
LIMIT 1;
+----+--------+--------------+-------------+----+---------------+---------------+
| id | title  | release_year | director_id | id | name          | year_of_birth |
+----+--------+--------------+-------------+----+---------------+---------------+
| 13 | Avatar |         2009 |           1 |  1 | James Cameron |          1954 |
+----+--------+--------------+-------------+----+---------------+---------------+

# What is the latest movie of the youngest actor ?
SELECT title, release_year, main_actors_tbl.name, main_actors_tbl.year_of_birth
FROM movies_tbl
    JOIN movie_actors_tbl ON movie_actors_tbl.movie_id = movies_tbl.id
    JOIN main_actors_tbl ON movie_actors_tbl.main_actor_id = main_actors_tbl.id
WHERE year_of_birth = (SELECT max(year_of_birth) FROM main_actors_tbl)
ORDER BY movies_tbl.release_year DESC
LIMIT 1;
+--------------+--------------+-----------+---------------+
| title        | release_year | name      | year_of_birth |
+--------------+--------------+-----------+---------------+
| Wonder Woman |         2017 | Gal Gadot |          1987 |
+--------------+--------------+-----------+---------------+