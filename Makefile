.PHONY: check-env clean build release

IMAGE_NAME := swiftlint

clean:
	rm -f Dockerfile

./Dockerfile:
	m4 -DSWIFT_VERSION=$(SWIFT_VERSION) ./Dockerfile.m4 > ./Dockerfile

build: check-env clean ./Dockerfile
	docker build . --build-arg SWIFTLINT_REVISION="$(SWIFTLINT_REVISION)" --tag $(IMAGE_NAME):$(SWIFTLINT_REVISION)

release: build
	docker push $(IMAGE_NAME):$(SWIFTLINT_REVISION)

check-env:
ifndef SWIFTLINT_REVISION
  $(error SWIFTLINT_REVISION is undefined)
endif
ifndef SWIFT_VERSION
  $(error SWIFT_VERSION is undefined)
endif