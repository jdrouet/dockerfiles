VERSION?=latest
POSTGRES_VERSION=9.6
POSTGIS_VERSION=2.3

IMAGE_NAME=jdrouet/postgis

buildx:
	docker buildx build \
		--build-arg POSTGRES_VERSION=${POSTGRES_VERSION} \
		--build-arg POSTGIS_VERSION=${POSTGIS_VERSION} \
		--platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 \
		-t ${IMAGE_NAME}:${VERSION} .

buildx-push:
	docker buildx build --push \
		--build-arg POSTGRES_VERSION=${POSTGRES_VERSION} \
		--build-arg POSTGIS_VERSION=${POSTGIS_VERSION} \
		--platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 \
		-t ${IMAGE_NAME}:${VERSION} .
