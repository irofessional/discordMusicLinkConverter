FROM python:3.10.4-slim-buster

ADD src /src
ADD docker-requirements.txt /src

WORKDIR /src
RUN pip install -r docker-requirements.txt --no-cache

CMD ["python3", "/src/bot/app.py"]