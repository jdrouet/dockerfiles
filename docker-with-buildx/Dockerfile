FROM alpine AS fetcher

RUN apk add curl jq

RUN export BUILDX_VERSION=$(curl -s 'https://api.github.com/repos/docker/buildx/releases' | jq -r '.[0].tag_name') \
  && curl -L --output /docker-buildx "https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64"

RUN chmod a+x /docker-buildx

FROM docker:latest

COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx

