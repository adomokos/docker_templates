DBUSER=db_user
DBPASSWD=db_password
DBNAME=some_db

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

IMAGE=custom_ruby

build-db: ## Builds the DB
	dropdb --if-exists --username $(USER) $(DBNAME)
	createdb --username $(USER) $(DBNAME)

build-image: ## Builds the Docker image
	docker build -t $(IMAGE) .

run: ## Runs the image in the container
	docker run -d --name $(IMAGE)_running $(IMAGE) tail -f /dev/null

hop-on: ## Get on the instance shell
	docker exec -t -i $(IMAGE)_running /bin/bash

remove: ## Remove both the container and the image
	docker stop $(IMAGE)_running
	docker rm $(IMAGE)_running
	docker rmi $(IMAGE)

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
