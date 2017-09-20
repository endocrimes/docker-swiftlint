.PHONY: clean build release

NAME := swiftlint

clean:
	rm Dockerfile

./Dockerfile:
	m4 -DSWIFTLINTREV=$(REV) ./Dockerfile.m4 > ./Dockerfile

build: ./Dockerfile
	docker build . -t $(NAME):$(REV)

release: build
	docker push $(NAME):$(REV)
