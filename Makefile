include .env

##### frontend
.PHONY: build-front
build-front:
	docker build --force-rm=true -t p6-front:$(DOCKER_TAG_FRONTEND) -f ./app/Dockerfile.frontend ./app/frontend

.PHONY: build-no-cache-front
build-no-cache-front:
	docker build --force-rm=true --no-cache -t p6-front:$(DOCKER_TAG_FRONTEND) -f ./app/Dockerfile.frontend ./app/frontend
