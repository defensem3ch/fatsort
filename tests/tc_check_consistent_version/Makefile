include ../testconfig.mk

all: passed 

execute:
	manver=\
	`head -2 ../../man/fatsort.1 | tail -1 | sed -e "s/^.*\"fatsort \([0-9\.]\+\)\".*/\1/"`; \
	progver=`../../src/fatsort --version | head -1 | sed -e "s/^fatsort \([0-9.]\+\).*/\1/"`; \
	changesver=`head -3 ../../CHANGES.md | tail -1 | sed -e "s/^.*v\([0-9.]\+\).*/\1/"`; \
	echo "#$$manver#$$progver#$$changesver#"; \
	[ "$$manver" = "$$progver" ]; \
	[ "$$changesver" = "$$progver" ]

passed: execute
	touch passed

clean:
	rm -f passed

.PHONY: clean execute

