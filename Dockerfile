FROM python:3.6.6-alpine
ADD . /heroku
WORKDIR /heroku
RUN pip install -r requirements.txt
CMD ["python","/heroku/manage.py","makemigrations"]
CMD ["python","/heroku/manage.py","migrate"]
CMD ["gunicorn", "--worker-class=sync","--workers=4", "--reload", "--log-level", "debug", "--log-file=-", "--access-logfile=-", "binanceapigateway.wsgi", "--chdir", "/heroku", "-b", "0.0.0.0:5000"]
#python /app/manage.py compilemessages
#python /app/manage.py collectstatic
