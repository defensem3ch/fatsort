SHELL=/bin/bash
BBE=bbe
VALGRIND=valgrind
FATSORT=../../src/fatsort
CURRENT_DIR=$(shell basename ${CURDIR})
MOUNT_POINT=/tmp/fatsort-${CURRENT_DIR}-mountpoint
MOUNT_UID=1000
MOUNT_GID=1000
FS_IMG=/tmp/fatsort-${CURRENT_DIR}-fs.img
# delete fs when test passed
DEL_FS_ON_PASS=1
TMPFILE=/tmp/fatsort-${CURRENT_DIR}-tmpfile
TMPDIR=/tmp/fatsort-${CURRENT_DIR}-tmpdir
IMAGEDIR=../images
export LC_ALL=en_US.UTF-8
