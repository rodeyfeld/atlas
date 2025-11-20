FROM postgis/postgis:16-master

WORKDIR /app

COPY . /app
COPY init.sql /docker-entrypoint-initdb.d/
