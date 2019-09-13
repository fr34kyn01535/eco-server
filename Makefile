
ECO_VERSION = $(shell wget -qO- https://s3-us-west-2.amazonaws.com/eco-releases/\?prefix\=EcoServer | grep -o -m 1 '[^>]*-beta.zip' | tail -n 1 | grep -Po '\d.\d.\d.\d')
DOCKER_IMAGE_BASE = docker.pkg.github.com/fr34kyn01535/eco-server/eco-server
DOCKER_IMAGE = ${DOCKER_IMAGE_BASE}:${ECO_VERSION}

all: build push clean

build:
	docker build --rm \
	-t ${DOCKER_IMAGE} \
	-t ${DOCKER_IMAGE_BASE}:latest \
	.

push:
	docker push ${DOCKER_IMAGE}
	docker push ${DOCKER_IMAGE_BASE}:latest

clean:
	rm -rf "${ECO_FILENAME}"

run:
	mkdir -p ~/eco-server/Storage ~/eco-server/Configs && \
	docker run -d --name "eco-server" \
	-v ~/eco-server/Storage:/srv/eco-server/Storage \
	-v ~/eco-server/Configs:/srv/eco-server/Configs \
	--network=host \
	${DOCKER_IMAGE}
	
