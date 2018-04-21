export REPODEST=/tmp/packages

PACKAGES := $(wildcard */.)

$(PACKAGES):
	cd $@ && abuild checksum && abuild -r

all: $(PACKAGES)

docker:
	@docker run --rm -it -v $(shell pwd):/packages -v $(shell pwd)/../output:/tmp/packages --entrypoint=sh -u alpine massiveco/docker-alpine-sdk -c 'cd /packages && ls && make all'

shell:
	docker run --rm -it -v $(shell pwd):/packages -v $(shell pwd)/../output:/home/alpine/packages -u alpine massiveco/docker-alpine-sdk

.PHONY: all $(PACKAGES)