#!/bin/bash

set -xe

export DOCKER_VERSION=$(curl https://api.github.com/repos/moby/moby/releases/latest | jq -r .tag_name)
export DOCKER_VERSION=${DOCKER_VERSION:1}

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/docker-with-compose:latest \
  --build-arg DOCKER_VERSION=$DOCKER_VERSION \
  .

