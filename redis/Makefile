DBUSER=db_user
DBPASSWD=db_password
DBNAME=some_db

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help
NAME=adomokos/redis

build-db: ## Builds the DB
	dropdb --if-exists --username $(USER) $(DBNAME)
	createdb --username $(USER) $(DBNAME)

build-image: ## Builds the Docker image
	docker build -t $(NAME) .

remove: ## Remove the container and image
	docker stop redis
	docker rm redis
	docker rmi $(NAME)

run: ## Starts the container
	docker run --name redis -d adomokos/redis

run-client: ## Run a client to check redis
	docker run --link redis:db -i -t ubuntu:14.04 /bin/bash

# Example here - https://docs.docker.com/engine/examples/running_redis_service/#create-your-web-application-container

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
