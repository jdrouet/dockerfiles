VERSION?=latest

IMAGE_NAME=jdrouet/tor-proxy

buildx:
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 \
		-t ${IMAGE_NAME}:${VERSION} .

buildx-push:
	docker buildx build --push \
		--platform linux/arm/v7,linux/arm64/v8,linux/386,linux/amd64 \
		-t ${IMAGE_NAME}:${VERSION} .

build: build-arm32v7 build-arm64v8 build-i386 build-amd64

build-arm32v7:
	docker build \
		--build-arg ARCH=arm32v7/ \
		-t ${IMAGE_NAME}:${VERSION}-arm32v7 .

build-arm64v8:
	docker build \
		--build-arg ARCH=arm64v8/ \
		-t ${IMAGE_NAME}:${VERSION}-arm64v8 .

build-i386:
	docker build \
		--build-arg ARCH=i386/ \
		-t ${IMAGE_NAME}:${VERSION}-i386 .

build-amd64:
	docker build \
		--build-arg ARCH=amd64/ \
		-t ${IMAGE_NAME}:${VERSION}-amd64 .

push-images: push-arm32v7 push-arm64v8 push-i386 push-amd64

push-arm32v7:
	docker push ${IMAGE_NAME}:${VERSION}-arm32v7

push-arm64v8:
	docker push ${IMAGE_NAME}:${VERSION}-arm64v8

push-i386:
	docker push ${IMAGE_NAME}:${VERSION}-i386

push-amd64:
	docker push ${IMAGE_NAME}:${VERSION}-amd64

manifest: manifest-arm32v7 manifest-arm64v8 manifest-i386 manifest-amd64

manifest-create:
	docker manifest create --amend ${IMAGE_NAME}:${VERSION} \
		${IMAGE_NAME}:${VERSION}-arm32v7 \
		${IMAGE_NAME}:${VERSION}-arm64v8 \
		${IMAGE_NAME}:${VERSION}-i386 \
		${IMAGE_NAME}:${VERSION}-amd64

manifest-arm32v7: manifest-create
	docker manifest annotate ${IMAGE_NAME}:${VERSION} \
		${IMAGE_NAME}:${VERSION}-arm32v7 \
		--arch arm --variant v7

manifest-arm64v8: manifest-create
	docker manifest annotate ${IMAGE_NAME}:${VERSION} \
		${IMAGE_NAME}:${VERSION}-arm64v8 \
		--arch arm64 --variant v8

manifest-i386: manifest-create
	docker manifest annotate ${IMAGE_NAME}:${VERSION} \
		${IMAGE_NAME}:${VERSION}-i386 \
		--arch 386

manifest-amd64: manifest-create
	docker manifest annotate ${IMAGE_NAME}:${VERSION} \
		${IMAGE_NAME}:${VERSION}-amd64 \
		--arch amd64

push-manifest:
	docker manifest push ${IMAGE_NAME}:${VERSION}
