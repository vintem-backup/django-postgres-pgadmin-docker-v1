FROM python:3.7.3-alpine3.9
ENV PYTHONUNBUFFERED 1
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev
RUN mkdir code/
WORKDIR code/
ADD requirements.txt code/
RUN pip install --upgrade pip

#já aponta para a pasta code? (WORKDIR)
RUN pip install -r code/requirements.txt 

ADD . code/
CMD ["sh", "wait_db.sh"]