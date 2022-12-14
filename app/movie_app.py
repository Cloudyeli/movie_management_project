#Standard Libary
import json

from flask import Flask, render_template
from flask_mysqldb import MySQL



app = Flask("MovieApp")

app.config["MYSQL_HOST"] = "172.17.0.2"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "my-secret-pw"
app.config["MYSQL_DB"] = "movie_db"

mysql = MySQL(app)

# Decorater
@app.route("/")
def hello_world():
    return "<p>Hello World!</p>"

@app.route("/movies/")
def list_movies():
    cursor = mysql.connection.cursor()
    #here we dont need semicolon
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    ### Fetches all the rows of a query result. 
    ### It returns all the rows as a list of tuples. An empty list is returned if there is no record to fetch.
    data = cursor.fetchall()
    cursor.close()
    return json.dumps(data)

@app.route("/movies-table/")
def list_movie_table():
    cursor = mysql.connection.cursor()
    #here we dont need semicolon
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("movies.html.tpl", movies_data=data)

if __name__ == "__main__":
    app.run(host="127.0.0.1")
    













