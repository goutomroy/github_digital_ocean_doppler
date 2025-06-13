FROM python:3.12-alpine

RUN mkdir /app
WORKDIR /app

# Install system dependencies including Doppler CLI
RUN apk add --no-cache \
    gcc \
    musl-dev \
    python3-dev \
    curl \
    gnupg \
    bash


# Install Doppler CLI
RUN curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh | sh


# Install Python dependencies
RUN pip install -U pip setuptools wheel ruamel.yaml.clib
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 5000
ENV FLASK_APP=app.py


COPY . .

LABEL maintainer="Goutom Roy" version="1.0.0"

# Run Gunicorn with Doppler
CMD ["doppler", "run", "--", "gunicorn", "--bind", "0.0.0.0:5000", "hello.app:app"]