#pull official base image
FROM python:3.10-slim

RUN apt-get update

RUN apt-get install python3-dev build-essential -y

# set environment variables
#pyc uzantılı prosses üretmesini engelleriz
ENV PYTHONDONTWRITEBYTECODE 1
ENV VIRTUAL_ENV=/opt/venv

# pip requirments
RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv /$VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app

