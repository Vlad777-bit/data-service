include ./docker/.env

# --------------------------------------------------------------------
# Variables
# --------------------------------------------------------------------
DOCKER_COMPOSE = docker compose -f ./docker/docker-compose.yml

# --------------------------------------------------------------------
# Default Targets
# --------------------------------------------------------------------
.PHONY: rebuild
rebuild: down build up

# --------------------------------------------------------------------
# Docker compose
# --------------------------------------------------------------------
.PHONY: buildx
buildx:
	@echo "Building docker images..."
	@${DOCKER_COMPOSE} build
	@echo "Done"
	@echo ""

.PHONY: up
up:
	@echo "Starting docker containers..."
	${DOCKER_COMPOSE} up -d --remove-orphans
	@echo "Done"
	@echo ""


.PHONY: down
down:
	@echo "Stopping docker containers..."
	${DOCKER_COMPOSE} down -v --rmi=all --remove-orphans
	@echo "Done"
	@echo ""

.PHONY: logs
logs:
	@echo "Showing docker logs..."
	${DOCKER_COMPOSE} logs -f
	@echo "Done"
	@echo ""

.PHONY: ps
ps:
	@echo "Showing docker ps..."
	${DOCKER_COMPOSE} ps
	@echo "Done"
	@echo ""

.PHONY: restart
restart:
	@echo "Restarting docker containers..."
	${DOCKER_COMPOSE} restart
	@echo "Done"
	@echo ""
