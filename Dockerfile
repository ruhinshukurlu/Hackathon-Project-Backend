FROM python:3.7

# Ensure that Python outputs everything that's printed inside
# the application rather than buffering it.
ENV PYTHONUNBUFFERED 1
ENV APP_ROOT /code
ENV DEBUG False

RUN apt-get update && apt-get install -y \
  locales \
  locales-all \
  build-essential \
  libpq-dev \
  libjpeg-dev \
  binutils \
  libproj-dev \
  gdal-bin \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  libffi-dev \
  libssl-dev

ADD requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir ${APP_ROOT}
COPY ./mainProject ${APP_ROOT}
WORKDIR ${APP_ROOT}

RUN python manage.py collectstatic --noinput
CMD [ "gunicorn", "--bind", "0.0.0.0", "-p", "8050", "mainProject.mainProject.wsgi" ]