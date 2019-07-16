
ECO_VERSION ?= 0.8.2.8-beta

DOCKER_IMAGE = fr34kyn01535/eco-server
DOCKER_TARGET = ${DOCKER_IMAGE}:${ECO_VERSION}

all: build push clean

build:
	docker build --rm \
	--label "eco.version=${ECO_VERSION}" \
	--build-arg ECO_VERSION="${ECO_VERSION}" \
	-t ${DOCKER_TARGET} \
	-t ${DOCKER_IMAGE} \
	.

push:
	docker push ${DOCKER_IMAGE}

clean:
	rm -rf "${ECO_FILENAME}"

run:
	mkdir -p ~/eco-server/Storage ~/eco-server/Configs && \
	docker run -d --name "eco-server" \
	-v ~/eco-server/Storage:/srv/eco-server/Storage \
	-v ~/eco-server/Configs:/srv/eco-server/Configs \
	--network=host \
	${DOCKER_TARGET}
	
