DOCKER_IMAGE=$(shell docker build -q .)

docs:
	docker run -it -v $(shell pwd)/site:/src/site $(DOCKER_IMAGE) build

.PHONY: docs