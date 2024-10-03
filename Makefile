MANDIR=/usr/local/share/man/man1

INSTALL_FLAGS=-m 0755 -p -D

#detect Mac OS X
UNAME=$(shell uname -s)
ifeq ($(UNAME),Darwin)
INSTALL_FLAGS=-m 0755 -p
endif

all: src

src:
	$(MAKE) -C src/

man: src
	$(MAKE) -C man/

clean:
	$(MAKE) -C src/ clean
	$(MAKE) -C man/ clean

mrproper:
	${MAKE} -C tests/ clean
	$(MAKE) -C src/ clean
	$(MAKE) -C man/ clean

install:
	install $(INSTALL_FLAGS) man/fatsort.1 $(DESTDIR)$(MANDIR)/fatsort.1
	$(MAKE) -C src/ install
tests: all
	$(MAKE) -C tests/


.PHONY: src man tests clean
