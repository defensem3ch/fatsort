DOCKER=$(shell which docker)
TOUCH=$(shell which touch)
WGET=$(shell which wget)
TAR=$(shell which tar)

DOCKERTESTS=$(wildcard docker_tests_*)

all: $(DOCKERTESTS)

important: docker_tests_i386 docker_tests_amd64 docker_tests_ppc

$(DOCKERTESTS): Makefile
	make -C $@

delete_all: delete_images

delete_images: delete_containers
	${DOCKER} rmi $(shell ${DOCKER} images -q) || true

delete_containers:
	${DOCKER} rm $(shell ${DOCKER} ps -a -q) || true

clean:
	for i in $(DOCKERTESTS); \
		do make -C $$i clean; \
	done

.PHONY: clean important $(DOCKERTESTS)

