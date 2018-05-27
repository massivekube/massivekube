STABLE_PACKAGES=$(wildcard stable/*)
TESTING_PACKAGES := $(wildcard testing/*)

testing: $(TESTING_PACKAGES)

stable: $(STABLE_PACKAGES)

$(STABLE_PACKAGES):
	cd $@ && REPODEST=/tmp/packages abuild -r

$(TESTING_PACKAGES):
	cd $@ &&  REPODEST=/tmp/packages abuild -r

all: $(STABLE_PACKAGES) $(TESTING_PACKAGES)

docker:
	@docker run --rm -it -v $(shell pwd):/packages -v $(shell pwd)/../output/packages:/tmp/packages --entrypoint=sh -u alpine massiveco/docker-alpine-sdk -c 'cd /packages && make all'

shell:
	docker run --rm -it -v $(shell pwd):/packages -v $(shell pwd)/../output/packages:/home/alpine/packages -u alpine massiveco/docker-alpine-sdk

.PHONY: all $(TESTING_PACKAGES) $(STABLE_PACKAGES)