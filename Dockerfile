FROM python:3.7-alpine
LABEL MANTAINER="Diego Negrette"

ENV PYTHONUNBUFFERED 1

#COPY ./requirements.txt /requirements.txt
#RUN pip install -r /requirements.txt

COPY ./Pipfile /Pipfile
COPY ./Pipfile.lock /Pipfile.lock
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user