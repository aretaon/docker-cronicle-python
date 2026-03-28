FROM docker.io/cronicle/edge:v1.14.1

ENV PYTHONUNBUFFERED=1

RUN apk add --no-cache python3 py3-pip

WORKDIR /opt/cronicle
COPY python-script-plugin.py ./bin/python-script-plugin.py
RUN chmod +x ./bin/python-script-plugin.py
