from flask import Flask

app = Flask(__name__)


@app.route('/')
def root():
    return '<div align=center><h1>Hello there</h1></div>'


if __name__ == "__main__":
    app.run(debug=True)
