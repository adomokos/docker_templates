DBUSER=db_user
DBPASSWD=db_password
DBNAME=some_db

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help
NAME=custom_psql

build-db: ## Builds the DB
	dropdb --if-exists --username $(USER) $(DBNAME)
	createdb --username $(USER) $(DBNAME)

build-image: ## Builds the Docker image
	docker build -t custom_psql .

remove: ## Remove the container and image
	docker stop $(NAME)_running
	docker rm $(NAME)_running
	docker rmi $(NAME)

start-container: ## Starts the container
	docker run -d --name custom_psql_running -p 5432:5432 $(NAME)
	@$(MAKE) -f $(THIS_FILE) run

run: ## Run the container
	docker start custom_psql_running

connect-to-db: ## Connects to the postgres db in the container from the host
	psql -h 127.0.0.1 -U postgres

hop-on: ## Get on the instance shell
	docker exec -t -i $(NAME)_running /bin/bash

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
