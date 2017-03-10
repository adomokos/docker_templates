NAME=custom_redis

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

build-image: ## Builds the Docker image
	docker build -t $(NAME) .

remove: ## Remove the container and image
	docker stop $(NAME)_running
	docker rm $(NAME)_running
	docker rmi $(NAME)

run: ## Starts the container
	docker run \
		--name $(NAME)_running \
		-p 6379:6379 \
		-d $(NAME)

run-client: ## Run a client to check redis
	docker run --link redis:db -i -t ubuntu:14.04 /bin/bash

hop-on: ## Get on the instance shell
	docker exec -t -i $(NAME)_running /bin/bash

# Example here - https://docs.docker.com/engine/examples/running_redis_service/#create-your-web-application-container

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
