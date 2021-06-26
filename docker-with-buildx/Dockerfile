ARG BUILDX_VERSION=v0.5.1
ARG DOCKER_VERSION=latest

FROM alpine AS fetcher

RUN apk add curl

RUN curl -L --output /docker-buildx "https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64"

RUN chmod a+x /docker-buildx

ARG DOCKER_VERSION
FROM docker:${DOCKER_VERSION}

COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx

