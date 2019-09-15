VERSION?=latest

IMAGE_NAME=jdrouet/privoxy

buildx:
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 \
		-t ${IMAGE_NAME}:${VERSION} .

buildx-push:
	docker buildx build --push \
		--platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 \
		-t ${IMAGE_NAME}:${VERSION} .
