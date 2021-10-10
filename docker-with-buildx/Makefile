DOCKER_VERSIONS=stable 20 20.10 20.10.8
BUILDX_VERSIONS=0.6.3
EXTRA_ARGS?=

build:
	for DOCKER_VERSION in $(DOCKER_VERSIONS); do \
	for BUILDX_VERSION in $(BUILDX_VERSIONS); do \
	docker buildx build ${EXTRA_ARGS} --build-arg DOCKER_VERSION=$$DOCKER_VERSION --build-arg BUILDX_VERSION=$$BUILDX_VERSION -t jdrouet/docker-with-buildx:$$DOCKER_VERSION-$$BUILDX_VERSION . ; \
	done ; \
	done

