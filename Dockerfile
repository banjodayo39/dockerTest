# We use the official Python image.
# https://hub.docker.com/_/python
FROM python:3.7
# Copy local code to the container image.
ENV APP_HOME  
WORKDIR $APP_HOME
RUN mkdir webFiles
COPY . .
# Install dependencies.
RUN pip install gunicorn flask
#CMD exec gunicorn --access-logfile - app:app
CMD ["gunicorn"  , "-b", "0.0.0.0:8000", "app:app"]
