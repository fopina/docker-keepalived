BASE_IMAGE_NAME = ghcr.io/fopina/keepalived
PLATFORMS = linux/amd64,linux/arm/v7,linux/arm64
ACTION = load

templ:
	docker buildx build \
				--platform $(PLATFORMS) \
				-t $(BASE_IMAGE_NAME):$(shell git log --oneline | wc -l | tr -d ' ') \
				-t $(BASE_IMAGE_NAME):latest \
				$(DOCKER_EXTRA) \
				--$(ACTION) .

build:
	make templ PLATFORMS=linux/amd64 ACTION=load

push:
	make templ ACTION=push
