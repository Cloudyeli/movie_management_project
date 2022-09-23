# List all the actors born before 1980.

mysql> SELECT name
    -> FROM main_actors_tbl
    -> WHERE year_of_birth < 1980;
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
6 rows in set (0.04 sec)

# How many movies did Nolan direct ?




# Among all the movies of James Cameron, how many were female actors ?
# How many directors did Leonardo DiCaprio worked with ?
# Who is the oldest director ?
# What is the earliest movie of the oldest director ?
# What is the latest movie of the youngest actor ?