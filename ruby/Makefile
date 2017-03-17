IMAGE=custom_ruby
NETWORK_NAME=my_custom_network

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

build-db: ## Builds the DB
	dropdb --if-exists --username $(USER) $(DBNAME)
	createdb --username $(USER) $(DBNAME)

build-image: ## Builds the Docker image
	docker build -t $(IMAGE) .

run: ## Runs the image in the container
	docker run -d -v ~/Programming/Docker/templates/ruby/app/:/var/data/app \
		--name $(IMAGE)_running $(IMAGE) tail -f /dev/null

run-in-network: ## Starts the container in the network
	docker run -d \
		--net $(NETWORK_NAME) \
		--name $(IMAGE)_running \
		$(IMAGE) \
		tail -f /dev/null

hop-on: ## Get on the instance shell
	docker exec -t -i $(IMAGE)_running /bin/bash

compose-up: ## Docker compose up
	docker-compose up -d

compose-down: ## Stop the environment
	docker-compose down
	# docker-compose down --volumes # destroys the volume as well


remove: ## Remove both the container and the image
	docker stop $(IMAGE)_running
	docker rm $(IMAGE)_running
	docker rmi $(IMAGE)

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
