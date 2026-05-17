FROM python:3.12-slim-bookworm

RUN useradd --create-home wagtail
ENV PYTHONUNBUFFERED=1 PORT=8000

RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential libpq-dev libjpeg62-turbo-dev zlib1g-dev libwebp-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install "gunicorn==23.0.0"

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

WORKDIR /app
RUN chown wagtail:wagtail /app
COPY --chown=wagtail:wagtail . .
USER wagtail

RUN python manage.py collectstatic --noinput --clear

CMD set -xe; python manage.py migrate --noinput; gunicorn config.wsgi:application --bind 0.0.0.0:$PORT
