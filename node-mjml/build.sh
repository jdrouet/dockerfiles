#!/bin/bash

set -xe

export MJML_VERSION=$(curl https://api.github.com/repos/mjmlio/mjml/releases/latest | jq -r .tag_name)
export MJML_VERSION=${MJML_VERSION:1}

echo "# Building jdrouet/node-mjml:$MJML_VERSION"

docker buildx build ${EXTRA_ARGS} \
  --platform linux/amd64,linux/arm64 \
  --tag jdrouet/node-mjml:latest \
  --tag jdrouet/node-mjml:${MJML_VERSION} \
  --tag jdrouet/node-mjml:$(echo $MJML_VERSION | cut -d '.' -f 1-2) \
  --tag jdrouet/node-mjml:$(echo $MJML_VERSION | cut -d '.' -f 1) \
  --build-arg MJML_VERSION=$MJML_VERSION \
  .
