# Docker Test Evironments
The Makefile in this directory sets up test environments for different CPU architectures with the use of docker.

## Prerequisites
- Docker binary needs to provide for build time volume mount option (currently only available in Redhat based distributions)

## Supported architectures
The following architectures are supported:
- i386
- amd64
- ppc (big endian)
- ppc64
- arm

## Run tests
Use the following commands to perform testing.
```Bash
make # to run tests for all supported architectures.
make important # to run tests for architectures i386, amd64 and ppc
make ARCH # test one just one architecture where ARCH is one of the supported architectures
```

## Log files
After tests finished you will find a log file `result.log` for each tests architecture in the corresponding subdirectory.
