FROM python:3.10.4-slim-buster

ADD src /src
ADD requirements.txt /src

WORKDIR /src
RUN pip install -r requirements.txt --no-cache

CMD ["python3", "/src/app.py"]