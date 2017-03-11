NAME=my_custom_network

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

create-network: ## Builds the Docker network
	docker network create $(NAME)

run-apps-in-network: ## Run the apps in the network
	cd redis && make un-in-network

remove-network: ## Removes the Docker network
	docker network rm $(NAME)

inspect-network: ## Gather info about the network
	docker network inspect $(NAME)

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
