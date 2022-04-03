include .env
include .env.secret

##### nginx
.PHONY: build-nginx
build-nginx:
	docker build --force-rm=true -t p6-nginx:$(DOCKER_TAG_NGINX) -f ./app/Dockerfile.nginx ./app/nginx

.PHONY: build-no-cache-nginx
build-no-cache-nginx:
	docker build --force-rm=true --no-cache -t p6-nginx:$(DOCKER_TAG_NGINX) -f ./app/Dockerfile.nginx ./app/nginx

.PHONY: tag-nginx
tag-nginx:
	docker tag p6-nginx:$(DOCKER_TAG_NGINX) $(DOCKER_REPOSITORY_NGINX):$(DOCKER_TAG_NGINX)

.PHONY: push-nginx
push-nginx:
	docker tag p6-nginx:$(DOCKER_TAG_NGINX) $(DOCKER_REPOSITORY_NGINX):$(DOCKER_TAG_NGINX)
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $(DOCKER_REPOSITORY)
	docker push $(DOCKER_REPOSITORY_NGINX):$(DOCKER_TAG_NGINX)

.PHONY: pull-nginx
pull-nginx:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $(DOCKER_REPOSITORY)
	docker pull $(DOCKER_REPOSITORY_NGINX):$(DOCKER_TAG_NGINX)

##### frontend
.PHONY: build-front
build-front:
	docker build --force-rm=true -t p6-front:$(DOCKER_TAG_FRONT) -f ./app/Dockerfile.frontend ./app/frontend

.PHONY: build-no-cache-front
build-no-cache-front:
	docker build --force-rm=true --no-cache -t p6-front:$(DOCKER_TAG_FRONT) -f ./app/Dockerfile.frontend ./app/frontend

.PHONY: tag-front
tag-front:
	docker tag p6-front:$(DOCKER_TAG_FRONT) $(DOCKER_REPOSITORY_FRONT):$(DOCKER_TAG_FRONT) 

.PHONY: push-front
push-front:
	docker tag p6-front:$(DOCKER_TAG_FRONT) $(DOCKER_REPOSITORY_FRONT):$(DOCKER_TAG_FRONT)
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $(DOCKER_REPOSITORY)
	docker push $(DOCKER_REPOSITORY_FRONT):$(DOCKER_TAG_FRONT)

.PHONY: pull-front
pull-front:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $(DOCKER_REPOSITORY)
	docker pull $(DOCKER_REPOSITORY_FRONT):$(DOCKER_TAG_FRONT)

##### re-tag
.PHONY: re-tag
re-tag:
	docker tag $(DOCKER_REPOSITORY_NGINX):$(DOCKER_TAG_NGINX) p6-nginx:$(DOCKER_TAG_NGINX)
	docker tag $(DOCKER_REPOSITORY_FRONT):$(DOCKER_TAG_FRONT) p6-front:$(DOCKER_TAG_FRONT)