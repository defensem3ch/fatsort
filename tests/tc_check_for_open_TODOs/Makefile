include ../testconfig.mk

all: passed

passed: 
	! grep "TODO" ../../src/*.[hc]
	touch passed

clean:
	rm -f passed

.PHONY: clean

