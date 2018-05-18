.PHONY: check-env clean build release

ORG_NAME ?= dantoml
IMAGE_NAME := swiftlint

.PHONY: clean
clean:
	rm -f Dockerfile

./Dockerfile:
	m4 -DSWIFT_VERSION=$(SWIFT_VERSION) ./Dockerfile.m4 > ./Dockerfile

.PHONY: build
build: check-env clean ./Dockerfile
	docker build . --build-arg SWIFTLINT_REVISION="$(SWIFTLINT_REVISION)" --tag $(ORG_NAME)/$(IMAGE_NAME):$(SWIFTLINT_REVISION)

.PHONY: release
release: build
	docker push $(ORG_NAME)/$(IMAGE_NAME):$(SWIFTLINT_REVISION)

check-env:
ifndef SWIFTLINT_REVISION
  $(error SWIFTLINT_REVISION is undefined)
endif
ifndef SWIFT_VERSION
  $(error SWIFT_VERSION is undefined)
endif
