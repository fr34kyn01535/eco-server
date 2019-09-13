DOCKER_IMAGE = docker.pkg.github.com/fr34kyn01535/eco-server/base-image:latest

all: build push

build:
	docker build --rm \
	-t ${DOCKER_IMAGE} \
	.

push:
	docker push ${DOCKER_IMAGE}