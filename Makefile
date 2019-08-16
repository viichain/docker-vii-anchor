__PHONY__: build build-testing

build:
	docker build -t vii/quickstart -f Dockerfile .

build-testing:
	docker build -t vii/quickstart:testing -f Dockerfile.testing .
