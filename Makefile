default: help

help: ## Show this help
	@echo "Targets:"
	@fgrep -h "##" $(MAKEFILE_LIST) | grep ":" | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\):.*##[ \t]*/    \1 ## /' | sort | column -t -s '##'
	@echo

install-devbox: ## Install devbox
	curl -fsSL https://get.jetify.com/devbox | bash

up: ## Start services
	devbox services up

upd: ## Start services in background
	devbox services start

start: upd

down: ## Stop services
	devbox services down

restart: down upd ## Restart services

open: ## View in web browser
	open http://localhost:18080
