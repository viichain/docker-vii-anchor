__PHONY__: build

build:
	docker build -t vii/vii-anchor -f Dockerfile .
