DOCKER=$(shell which podman)
TOUCH=$(shell which touch)
WGET=$(shell which wget)
TAR=$(shell which tar)

all: build_image
	$(DOCKER) run --rm --privileged --group-add keep-groups -v ${CURDIR}:/home/tester/artifacts --tmpfs /tmp:rw,noexec,nosuid,size=2G -v ${CURDIR}/qemu-ppc-static:/usr/bin/qemu-ppc-static -it fatsort-test-ppc

build_image: Dockerfile qemu-ppc-static
	$(DOCKER) build -t fatsort-test-ppc -v ${CURDIR}/qemu-ppc-static:/usr/bin/qemu-ppc-static  .
	$(TOUCH) build_image

qemu-ppc-static:
	$(WGET) https://github.com/multiarch/qemu-user-static/releases/download/v4.1.0-1/qemu-ppc-static.tar.gz
	$(TAR) xvfz qemu-ppc-static.tar.gz

/proc/sys/fs/binfmt_misc/ppc:
	$(DOCKER) run --rm --privileged --group-add keep-groups multiarch/qemu-user-static:register

clean:
	rm -f *.log
	rm -f build_image
	rm -f *.tar.gz
	rm -f qemu-*-static

.PHONY: clean
