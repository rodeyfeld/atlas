# Atlas

PostgreSQL 16 with PostGIS extension - shared database image for Universe projects.

## Quick Start

### Build & Publish
```bash
docker build -t edrodefeld/atlas:latest .
docker push edrodefeld/atlas:latest
```

### Test Locally
```bash
docker run -p 5432:5432 --name atlas \
  -e POSTGRES_PASSWORD=atlas_password \
  -e POSTGRES_USER=atlas_user \
  -e POSTGRES_DB=mydb \
  -d atlas
```

## Usage in Docker Compose

```yaml
postgres:
  image: edrodefeld/atlas
  ports:
    - 5432:5432
  volumes:
    - postgres-db-volume:/var/lib/postgresql/data
  user: postgres
  environment:
    - POSTGRES_DB=augur
    - POSTGRES_USER=atlas_user
    - POSTGRES_PASSWORD=atlas_password
  healthcheck:
    test: ["CMD-SHELL", "pg_isready", "-d", "augur"]
    interval: 30s
    timeout: 60s
    retries: 5
    start_period: 80s
```

## Environment Variables

- `POSTGRES_DB` - Database name
- `POSTGRES_USER` - Database user (default: postgres)
- `POSTGRES_PASSWORD` - Required password

## Notes

- `init.sql` runs on first startup only
- Data persists in volumes across rebuilds
- Use `docker-compose down -v` to reset database
- Projects using this: augur, luna, pythology
