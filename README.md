* install doppler CLI
* doppler login
* doppler run --project cognitive-demo --config dev -- docker compose up -d
* doppler run --project cognitive-demo --config dev -- docker compose down
* doppler run --project cognitive-demo --config dev -- gunicorn -c gunicorn.py --reload "hello.app:app"

* doppler run --project cognitive-demo --config dev -- python3 -m unittest

## docker run
* docker build -t flask-doppler-app .
* docker run -p 5000:5000 flask-doppler-app

## without docker
* doppler run --token dp.st.dev.KRJhixzOQaw9u9lmrdNuDQXRAtmsY66mvzww6H0VyXL --project cognitive-demo --config dev -- gunicorn -c gunicorn.py --reload "hello.app:app"



docker login registry.digitalocean.com  
registry.digitalocean.com/cognitiveadv  


## ruff integration
ruff check  
ruff check src/numbers/calculate.py  
ruff check --fix  
ruff format  

# github branch

master
release
dev
feature

# apps/environment in DO

production
staging
development