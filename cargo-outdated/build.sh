#!/bin/bash

set -xe

export RUST_VERSION=$(curl https://api.github.com/repos/rust-lang/rust/releases/latest | jq -r '.tag_name')

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/cargo-outdated:latest \
  --tag jdrouet/cargo-outdated:bullseye \
  --tag jdrouet/cargo-outdated:$RUST_VERSION-bullseye \
  --tag jdrouet/cargo-outdated:$(echo $RUST_VERSION | cut -d '.' -f 1-2)-bullseye \
  --tag jdrouet/cargo-outdated:$(echo $RUST_VERSION | cut -d '.' -f 1)-bullseye \
  --build-arg RUST_VERSION=$RUST_VERSION \
  --build-arg BASE_TAG=bullseye \
  -f debian.Dockerfile \
  .

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/cargo-outdated:alpine \
  --tag jdrouet/cargo-outdated:$RUST_VERSION-alpine \
  --tag jdrouet/cargo-outdated:$(echo $RUST_VERSION | cut -d '.' -f 1-2)-alpine \
  --tag jdrouet/cargo-outdated:$(echo $RUST_VERSION | cut -d '.' -f 1)-alpine \
  --build-arg RUST_VERSION=$RUST_VERSION \
  --build-arg BASE_TAG=alpine \
  -f alpine.Dockerfile \
  .
