DOCKER=$(shell which podman)
TOUCH=$(shell which touch)
WGET=$(shell which wget)
TAR=$(shell which tar)

all: build_image
	$(DOCKER) run --rm --privileged -v ${CURDIR}:/home/tester/artifacts --tmpfs /tmp:rw,noexec,nosuid,size=2G -v ${CURDIR}/qemu-ppc64le-static:/usr/bin/qemu-ppc64le-static -it fatsort-test-ppc64le

build_image: Dockerfile qemu-ppc64le-static /proc/sys/fs/binfmt_misc/qemu-ppc64le do_tests.sh
	$(DOCKER) build -t fatsort-test-ppc64le -v ${CURDIR}/qemu-ppc64le-static:/usr/bin/qemu-ppc64le-static  .
	$(TOUCH) build_image

qemu-ppc64le-static:
	$(WGET) https://github.com/multiarch/qemu-user-static/releases/download/v4.1.0-1/qemu-ppc64le-static.tar.gz
	$(TAR) xvfz qemu-ppc64le-static.tar.gz

/proc/sys/fs/binfmt_misc/qemu-ppc64le:
	$(DOCKER) run --rm --privileged multiarch/qemu-user-static:register

clean:
	rm -f *.log
	rm -f build_image
	rm -f *.tar.gz
	rm -f qemu-*-static

.PHONY: clean
