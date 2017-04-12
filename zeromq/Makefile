IMAGE=custom_zeromq

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

build-image: ## Builds the Docker image
	docker build -t $(IMAGE) .

run: ## Runs the image in the container
	docker run -it --rm --name running_$(IMAGE) $(IMAGE)

run-in-network: ## Starts the container in the network
	docker run -d \
		--net $(NETWORK_NAME) \
		--name $(IMAGE)_running \
		$(IMAGE) \
		tail -f /dev/null

hop-on: ## Get on the instance shell
	docker exec -t -i $(IMAGE)_running /bin/bash

remove: ## Remove both the container and the image
	docker stop $(IMAGE)_running
	docker rm $(IMAGE)_running
	docker rmi $(IMAGE)

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
