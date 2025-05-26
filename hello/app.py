import os

from flask import Flask

app = Flask(__name__)


@app.route('/')
def counter():
    return f"response changed again: {os.getenv('WEB2_COUNTER_MSG')}"
