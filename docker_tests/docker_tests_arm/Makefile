DOCKER=$(shell which podman)
TOUCH=$(shell which touch)
WGET=$(shell which wget)
TAR=$(shell which tar)

all: build_image
	$(DOCKER) run --rm --privileged -v ${CURDIR}:/home/tester/artifacts --tmpfs /tmp:rw,noexec,nosuid,size=2G -v ${CURDIR}/qemu-arm-static:/usr/bin/qemu-arm-static -it fatsort-test-arm

build_image: Dockerfile qemu-arm-static /proc/sys/fs/binfmt_misc/qemu-arm do_tests.sh
	$(DOCKER) build -t fatsort-test-arm -v ${CURDIR}/qemu-arm-static:/usr/bin/qemu-arm-static .
	$(TOUCH) build_image

qemu-arm-static:
	$(WGET) https://github.com/multiarch/qemu-user-static/releases/download/v4.1.0-1/qemu-arm-static.tar.gz
	$(TAR) xvfz qemu-arm-static.tar.gz

/proc/sys/fs/binfmt_misc/qemu-arm:
	$(DOCKER) run --rm --privileged multiarch/qemu-user-static:register

clean:
	rm -f *.log
	rm -f build_image
	rm -f *.tar.gz
	rm -f qemu-*-static

.PHONY: clean
