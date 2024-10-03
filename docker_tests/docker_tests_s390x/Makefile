DOCKER=$(shell which podman)
TOUCH=$(shell which touch)
WGET=$(shell which wget)
TAR=$(shell which tar)

all: build_image
	$(DOCKER) run --rm --privileged --group-add keep-groups -v ${CURDIR}:/home/tester/artifacts --tmpfs /tmp:rw,noexec,nosuid,size=2G -v ${CURDIR}/qemu-s390x-static:/usr/bin/qemu-s390x-static -it fatsort-test-s390x

build_image: Dockerfile qemu-s390x-static do_tests.sh
	$(DOCKER) build -t fatsort-test-s390x -v ${CURDIR}/qemu-s390x-static:/usr/bin/qemu-s390x-static  .
	$(TOUCH) build_image

qemu-s390x-static:
	$(WGET) https://github.com/multiarch/qemu-user-static/releases/download/v4.1.0-1/qemu-s390x-static.tar.gz
	$(TAR) xvfz qemu-s390x-static.tar.gz

/proc/sys/fs/binfmt_misc/s390x:
	$(DOCKER) run --rm --privileged --group-add keep-groups multiarch/qemu-user-static:register

clean:
	rm -f *.log
	rm -f build_image
	rm -f *.tar.gz
	rm -f qemu-*-static

.PHONY: clean
