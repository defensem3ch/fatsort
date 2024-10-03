SHELL=/bin/bash
DATE=/bin/date

.PHONY: clean

LOGFILE="results.log"

TESTSUITES=$(wildcard ts_*)

all: ts_amd64

check_prerequisites:
#	@which valgrind &>/dev/null || (echo "You need valgrind to run the tests!"; false)

$(TESTSUITES): check_prerequisites 
	@SECONDS=0; failed=0; tests=0; new=0; \
	echo "Tests of testsuite $@ started on $(shell $(DATE) '+%Y-%m-%d %H:%M:%S')" | tee ${LOGFILE}; \
	for i in `cat $@`; do \
		if [ ! -f $$i/passed ]; then \
			printf "%.70s" "Test case $$i...                                                                 "; \
			printf "[ \e[1;33mWAIT \e[0m]"; \
			${MAKE} -C $$i &> /dev/null; \
			ret=$$?; \
			printf "\r%.70s" "Test case $$i...                                                                 "; \
			if [ $$ret -eq 0 ]; then \
				printf "[ \e[1;32mPASS \e[0m]\n"; \
				echo "Test case $$i passed." >> $(LOGFILE); \
			else \
				printf "[ \e[1;31mFAIL \e[0m]\n"; \
				echo "Test case $$i failed." >> $(LOGFILE); \
				(( failed+=1 )); \
			fi; \
			(( new+=1 )); \
		fi; \
		(( tests+=1 )); \
	done; \
	ELAPSED="$$((($$SECONDS / 60) % 60))' $$(($$SECONDS % 60))\""; \
	if [ $$failed -eq 0 ]; then \
	echo "All" $$tests "tests passed ("$$new "in this round) in $$ELAPSED." | tee -a ${LOGFILE}; \
	else \
	echo $$failed"/"$$tests "tests failed! ("$$new "in this round) in $$ELAPSED." | tee -a ${LOGFILE}; \
	fi; \
	[ "$$failed" -eq "0" ]

clean:
	rm -f *.log
	rm -f tc_*/*.log tc*/passed
	rm -f images/*.img
#	for i in `ls -d tc_*`; do $(MAKE) -C $$i clean || [ 1 ]; done


.PHONY: check_prerequisites clean
