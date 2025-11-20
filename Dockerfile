FROM postgis/postgis:17-master

WORKDIR /app

COPY . /app
COPY init.sql /docker-entrypoint-initdb.d/
