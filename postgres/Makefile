DBUSER=db_user
DBPASSWD=db_password
DBNAME=some_db

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

build-db: ## Builds the DB
	dropdb --if-exists --username $(USER) $(DBNAME)
	createdb --username $(USER) $(DBNAME)

build-image: ## Builds the Docker image
	docker build -t custom_psql .

run-container: ## Runs the image in the container
	docker run -d --name custom_psql_running -p 5432:5432 custom_psql

connect-to-db: ## Connects to the postgres db in the container from the host
	psql -h 127.0.0.1 -U postgres

hop-on: ## Get on the instance shell
	docker exec -t -i custom_psql_running /bin/bash

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
