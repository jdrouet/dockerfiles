#!/bin/bash

set -xe

export RUST_VERSION=$(curl https://api.github.com/repos/rust-lang/rust/releases/latest | jq -r '.tag_name')

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/rust-clippy:latest \
  --tag jdrouet/rust-clippy:bullseye \
  --tag jdrouet/rust-clippy:$RUST_VERSION-bullseye \
  --tag jdrouet/rust-clippy:$(echo $RUST_VERSION | cut -d '.' -f 1-2)-bullseye \
  --tag jdrouet/rust-clippy:$(echo $RUST_VERSION | cut -d '.' -f 1)-bullseye \
  --build-arg RUST_VERSION=$RUST_VERSION \
  --build-arg BASE_TAG=bullseye \
  --target debian \
  .

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/rust-clippy:alpine \
  --tag jdrouet/rust-clippy:$RUST_VERSION-alpine \
  --tag jdrouet/rust-clippy:$(echo $RUST_VERSION | cut -d '.' -f 1-2)-alpine \
  --tag jdrouet/rust-clippy:$(echo $RUST_VERSION | cut -d '.' -f 1)-alpine \
  --build-arg RUST_VERSION=$RUST_VERSION \
  --build-arg BASE_TAG=alpine \
  --target alpine \
  .
