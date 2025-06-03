# SHELL := /bin/bash
# .PHONY: setup test run help

# SERVICE_SRC_DIR := .


# setup:
# 	pip install -r requirements.txt

# run:
# 	PYTHONPATH=${SERVICE_SRC_DIR} . config/local_export && doppler run --token ${DOPPLER_TOKEN} --project cognitive-demo --config dev -- gunicorn -c gunicorn.py --reload "hello.app:app"

# debug:
# 	@echo "Testing Doppler token export..."  
# 	@. config/local_export && echo "DOPPLER_TOKEN=${DOPPLER_TOKEN}"  


# SHELL := /bin/bash
# .PHONY: setup test run help

# SERVICE_SRC_DIR := .

# setup:
# 	pip install -r requirements.txt

# run:
# 	$(eval DOPPLER_TOKEN := $(shell . config/local_export && echo $$DOPPLER_TOKEN))
# 	PYTHONPATH=${SERVICE_SRC_DIR} doppler run --token $(DOPPLER_TOKEN) --project cognitive-demo --config dev -- gunicorn -c gunicorn.py --reload "hello.app:app"

SHELL := /bin/bash
.PHONY: setup test run debug

SERVICE_SRC_DIR := .

setup:
	pip install -r requirements.txt

debug:
	@echo "Testing Doppler token export..."
	@source config/local_export && printenv DOPPLER_TOKEN

run:
	@source config/local_export && \
	export DOPPLER_TOKEN="$$DOPPLER_TOKEN" && \
	PYTHONPATH=${SERVICE_SRC_DIR} \
	doppler run \
        --token "$$DOPPLER_TOKEN" \
        --project cognitive-demo \
        --config dev \
        -- gunicorn -c gunicorn.py --reload "hello.app:app"