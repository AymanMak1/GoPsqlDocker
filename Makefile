postgres:
	docker run --name postgresLatest -p 1234:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it postgresLatest createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgresLatest dropdb --username=postgres --owner=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:1234/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:1234/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown