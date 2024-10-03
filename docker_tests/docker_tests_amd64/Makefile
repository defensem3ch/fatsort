DOCKER=$(shell which podman)
TOUCH=$(shell which touch)
WGET=$(shell which wget)
TAR=$(shell which tar)

all: build_image
	$(DOCKER) run --rm --privileged --group-add keep-groups -v ${CURDIR}:/home/tester/artifacts --tmpfs /tmp:rw,noexec,nosuid,size=2G -it fatsort-test-amd64

build_image: Dockerfile do_tests.sh
	$(DOCKER) build -t fatsort-test-amd64  .
	$(TOUCH) build_image

clean:
	rm -f *.log
	rm -f build_image
	rm -f *.tar.gz

.PHONY: clean build
