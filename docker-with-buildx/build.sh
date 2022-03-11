#!/bin/bash

set -xe

export DOCKER_VERSION=$(curl https://api.github.com/repos/moby/moby/releases/latest | jq -r .tag_name)
export DOCKER_VERSION=${DOCKER_VERSION:1}
export BUILDX_VERSION=$(curl https://api.github.com/repos/docker/buildx/releases/latest | jq -r .tag_name)
export BUILDX_VERSION=${BUILDX_VERSION:1}

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/docker-with-buildx:latest \
  --tag jdrouet/docker-with-buildx:$BUILDX_VERSION \
  --tag jdrouet/docker-with-buildx:$(echo $BUILDX_VERSION | cut -d '.' -f 1-2) \
  --tag jdrouet/docker-with-buildx:$DOCKER_VERSION-$BUILDX_VERSION \
  --build-arg DOCKER_VERSION=$DOCKER_VERSION \
  --build-arg BUILDX_VERSION=$BUILDX_VERSION \
  .
