* install doppler CLI
* doppler login
* doppler run --project cognitive-demo --config dev -- docker compose up -d
* doppler run --project cognitive-demo --config dev -- docker compose down
* doppler run --project cognitive-demo --config dev -- gunicorn -c gunicorn.py --reload "hello.app:app"

* doppler run --project cognitive-demo --config dev -- python3 -m unittest