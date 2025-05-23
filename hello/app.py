import os

from flask import Flask
from flask_redis import FlaskRedis

app = Flask(__name__)
app.config['REDIS_URL'] = os.getenv('REDIS_URL')

redis = FlaskRedis(app)


@app.route('/')
def counter():
    print(os.getenv('WEB2_COUNTER_MSG', ''))
    return '{0} {1}'.format(str(redis.incr('web2_counter')),
                            os.getenv('WEB2_COUNTER_MSG'))