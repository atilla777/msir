help:
	@echo "run        - Run database container for local development."
	@echo "psql       - run a postgresql shell against a running container."

# default args for psql
pg_user = postgres
pg_password = postgres
db = postgres

postgres:
	docker run --rm --name postgresql-container -v=${HOME}/docker/volumes/postgres:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_USER=${pg_user} -e POSTGRES_PASSWORD=${pg_password} postgres:latest

psql:
	docker exec -t -i postgresql-container psql -U $(user) -d $(db)