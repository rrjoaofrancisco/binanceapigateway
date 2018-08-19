FROM python:3.6.6-alpine
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["python","/app/manage.py","makemigrations"]
CMD ["python","/app/manage.py","migrate"]
CMD ["gunicorn", "--workers=4", "binanceapigateway.wsgi", "--chdir", "/app"]
#python /app/manage.py compilemessages
#python /app/manage.py collectstatic
