ARG DOCKER_VERSION
ARG BUILDX_VERSION
FROM docker/buildx-bin:${BUILDX_VERSION} AS fetcher

FROM docker:${DOCKER_VERSION}

COPY --from=fetcher /buildx /usr/libexec/docker/cli-plugins/docker-buildx

