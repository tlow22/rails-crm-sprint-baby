# Tiny CRM Development Tasks
.PHONY: help setup up down logs shell-rails shell-postgres test clean

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup: ## Initial setup - build containers and setup database
	docker-compose build
	docker-compose up -d postgres
	@echo "Waiting for PostgreSQL to be ready..."
	@sleep 10
	docker-compose run --rm rails bin/rails db:create db:migrate db:seed

up: ## Start all services
	docker-compose up -d

up-logs: ## Start all services with logs
	docker-compose up

down: ## Stop all services
	docker-compose down

logs: ## Show logs from all services
	docker-compose logs -f

logs-rails: ## Show Rails logs only
	docker-compose logs -f rails

logs-postgres: ## Show PostgreSQL logs only
	docker-compose logs -f postgres

shell-rails: ## Open Rails console in container
	docker-compose exec rails bin/rails console

shell-postgres: ## Open PostgreSQL shell
	docker-compose exec postgres psql -U crm_user -d mini_crm_development

test: ## Run Rails tests
	docker-compose exec rails bin/rails test

clean: ## Clean up containers and volumes
	docker-compose down -v
	docker system prune -f

reset: clean setup ## Reset everything - clean and setup from scratch

# Development helpers
migrate: ## Run database migrations
	docker-compose exec rails bin/rails db:migrate

seed: ## Seed database with sample data
	docker-compose exec rails bin/rails db:seed

bundle: ## Install gems
	docker-compose exec rails bundle install