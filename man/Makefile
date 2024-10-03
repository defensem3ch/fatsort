HELP2MAN=help2man

all: fatsort.1

fatsort.1: ../src/fatsort
	${HELP2MAN} --name "FAT sorting tool" ../src/fatsort -o fatsort.1 -N

clean:
	rm -f fatsort.1

.PHONY: clean
