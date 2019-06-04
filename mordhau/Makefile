.PHONY: init clean compile package test tag push

GIT_HASH := $(shell git rev-parse --short HEAD)
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

APP_NAME := "mordhau"
IMAGE_NAME := "gcr.io/noobshack-164103/$(APP_NAME)"

default: tag

clean:
compile:
package: compile
	docker build --pull --no-cache --build-arg GIT_HASH=$(GIT_HASH) -t $(IMAGE_NAME):$(GIT_HASH) .
test: 
tag: test
	docker tag $(IMAGE_NAME):$(GIT_HASH) $(IMAGE_NAME):latest
push: clean tag
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(GIT_HASH)
