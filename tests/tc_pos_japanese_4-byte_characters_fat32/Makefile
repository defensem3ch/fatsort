include ../testconfig.mk

TESTLOG=test.log

STDOUT=stdout.log
STDOUT_EXP=stdout_expected.txt
STDERR=stderr.log
STDERR_EXP=stderr_expected.txt
REF_FS_XZ=${IMAGEDIR}/fat32_good_japanese_filename.img.xz

XZ=xz

all: passed
	if [ ${DEL_FS_ON_PASS} -eq 1 ]; then rm -f ${FS_IMG}; fi

clean:
	rm -f passed
	rm -fr *.log *.tmp ${FS_IMG} ${TMPFILE} ${TMPDIR}

$(FS_IMG): $(REF_FS_XZ)
	# ++++++++++ Unpacking reference file systen ++++++++++
	mkdir -p $(TMPDIR)
	${XZ} -d -f --stdout ${REF_FS_XZ} >> ${FS_IMG}

execute: $(FS_IMG)
	# ++++++++++ Executing tests ++++++++++
	${FATSORT} ${FS_IMG}
	${FATSORT} -l ${FS_IMG} > ${STDOUT} 2> ${STDERR}
	diff ${STDOUT} ${STDOUT_EXP}
	diff ${STDERR} ${STDERR_EXP}

# check result
fsck: execute
	# ++++++++++ Checking file system ++++++++++
	fsck.vfat -n ${FS_IMG}

# test passed
passed: execute
	touch passed

.PHONY: passed fsck execute clean
