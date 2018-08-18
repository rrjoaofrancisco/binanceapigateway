FROM python:3.7-alpine
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["python","/app/manage.py","makemigrations"]
CMD ["python","/app/manage.py","migrate"]
CMD ["gunicorn", "--worker-class=sync","--workers=4", "--reload", "--log-level", "debug", "--log-file=-", "--access-logfile=-", "binanceapigateway.wsgi", "--chdir", "/app", "-b", "0.0.0.0:6600"]
#python /app/manage.py compilemessages
#python /app/manage.py collectstatic
