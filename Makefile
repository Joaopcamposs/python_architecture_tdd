# these will speed up builds, for docker-compose >= 1.25
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

all: down build up test

build:
	docker-compose build

up:
	docker-compose up -d fastapi

down:
	docker-compose down

logs:
	docker-compose logs fastapi | tail -100

test:
	pytest --tb=short

format:
	ruff format .