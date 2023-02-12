postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root gobank

dropdb:
	docker exec -it postgres12 dropdb  gobank

migrateup:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/gobank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/gobank?sslmode=disable" -verbose down

# sqlc:
# 	docker run name

.PHONY: postgres createdb dropdb migrateup migratedown