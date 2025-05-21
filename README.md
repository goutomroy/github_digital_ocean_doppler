* install doppler CLI
* doppler login
* doppler run --project cognitive-demo --config dev -- docker compose up -d

## best practice

**doppler secrets download --project cognitive-demo --config dev --no-file-check --format env > .doppler.env**   

```
version: '3'

services:
  redis:
    image: 'redis:3.2-alpine'
    ports:
      - '6379:6379'
    volumes:
      - 'redis:/data'

  web:
    build: .
    command: >
      gunicorn -c gunicorn.py --reload "hello.app:app"
    depends_on:
      - 'redis'
    # >>> REPLACE THE 'environment' BLOCK WITH THIS <<<
    env_file:
      - '.doppler.env' # Docker Compose will load all variables from this file
    # >>> END REPLACEMENT <<<
    ports:
      - '5000:5000'
    volumes:
      - '.:/app'

volumes:
  redis: {}
```