# Atlas

Postgres 17 with PostGIS - the shared database for everything in Universe.

## Build & push

```bash
docker build -t edrodefeld/atlas:latest .
docker push edrodefeld/atlas:latest
```

## Quick test

```bash
docker run -p 5432:5432 --name atlas \
  -e POSTGRES_PASSWORD=atlas_password \
  -e POSTGRES_USER=atlas_user \
  -e POSTGRES_DB=mydb \
  -d atlas
```

## Using in docker-compose

```yaml
postgres:
  image: edrodefeld/atlas
  ports:
    - 5432:5432
  volumes:
    - postgres-db-volume:/var/lib/postgresql/data
  environment:
    - POSTGRES_DB=augur
    - POSTGRES_USER=atlas_user
    - POSTGRES_PASSWORD=atlas_password
```

The `init.sql` script automatically creates the `augur` and `dreamflow` databases on first startup. Data persists in volumes, use `docker-compose down -v` to wipe everything.
