from flask import Flask


app = Flask("MovieApp")

@app.route("/")
def hello_world():
    return "<p>Hello World!</p>"


if __name__ = "__main__":
    app.run(host="127.0.0.1")
    













