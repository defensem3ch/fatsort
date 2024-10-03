# Tests
This file describes how to run tests for FATSort.

## Prerequisites
In order to run tests you need the following tools:
- bbe
- dosfstools
- valgrind

## Test suites
Run a test suite with
```Bash
make test_suite_name
```
All test suite names start with prefix `ts_`.

## Test cases
Run a single test case by changing to the subdirectory of the test and run
```Bash
cd test_case_directory
make
```
Test case directories start with prefix `tc_`.

## Clean up
Run
```Bash
make clean
```
to clean all test results and log files.
