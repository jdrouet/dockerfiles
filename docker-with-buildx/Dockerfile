ARG DOCKER_VERSION=stable
ARG BUILDX_VERSION=0.6.3
FROM docker/buildx-bin:${BUILDX_VERSION} AS fetcher

FROM docker:${DOCKER_VERSION}

COPY --from=fetcher /buildx /usr/libexec/docker/cli-plugins/docker-buildx

