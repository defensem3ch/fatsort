# Changelog

## v1.6.5 (March, 12th, 2023)
* refactored character conversion and fixed bugs related to multi-byte characters
* added checks for overly long filenames
* added test cases for long file names

## v1.6.4 (September 20th, 2021)
* fixed randomization for fatXX. Thanks go to Zoltán Döme for reporting the bug!
* added test cases for randomization option

## v1.6.3 (August  8th, 2020)
* fatsort release file now includes precompiled makefile
* fixed support for macOS (thanks to Max for the fix)
* declared OPT_LOCALE as extern
* fixed uninitialized variable
* avoided some string truncation compiler warnings
* implemented platform independent transliteration for invalid multi-byte characters during conversion
* test makefile now returns error code

## v1.6.2 (November 29, 2019)
- FIX: multiple endianness issues with exFAT
- now using /proc/self/mounts instead of /etc/mtab to check whether filesystem is mounted

## v1.6.1 (November 17, 2019)
- FIX: missing check if directory entries are of type file
- option -l now considers options -d, -D, -x, -X, -e and -E
- added check for dirty volumes
- added new test cases

## v1.6.0 (November 16, 2019)
- exFAT is now supported!
- directory entries are now only written back if reordering happened
- FIX: memory leak with regular expression lists
- code rewrite to make additional platforms possible in future

## v1.5.0 (September 19, 2018)
- added options -e and -E to select directories with regular expressions
- FIX: possible memory leak for `OPT_LOCALE`
- FIX: bug affecting case sensitive sorting with locales

## v1.4.2 (August 06, 2017)
- FIX: sorting with option -m on big endian architectures is now working as intended
- reproducible docker tests added for i386, amd64, ppc64le
- added clean target for manpage
- updated tests

## v1.4.1 (July 29, 2017)
- fixed memory leak when providing multiple locales
- fixed test tc\_check\_consistent\_version
- added //TRANSLIT to `iconv_open` so iconv will no longer fail when a character cannot be converted
- added missing test cases

## v1.4 (July 28, 2017)
- added option -L to specify an alternate locale to be used
- added warning if C locale is used
- added valgrind tests
- fixed possible memory leak found with valgrind

## v1.3.1 (July 19, 2017)
- increased maximum cluster size to 64kb
- fixed descriptions for options -I, -o, -d, -D, -x and -X in manpage
- replaced some `fclose` with `fs_close`
- changed iconv error to warning
- fixed a test case

## v1.3 (February 28, 2014)
- added option -a for ASCIIbetical sorting
- added test cases for option -a

## v1.2 (July 12, 2013)
- fatsort now sychronizes filesystems after sorting each directory
- added long options --version and --help
- updated version and help output for help2man
- added Makefile for manpage
- minor changes

## v1.1.1 (June 09, 2013)
- fixed character conversion for non-UTF-8 systems

## v1.1 (May 23, 2013)
- New option -t to sort by last modification date time. Thanks to Charles Anthony for the patch.
- More and updated tests
- Minor changes

## v1.0.1 (May 17, 2013)
- FIX: big endian issue for FAT12/16 in function getFATEntry
- FIX: big endian issue for `BS_SecPerClus`
- FIX: Stack overflow in cmpentries
- FIX: checkLongDirEntries now ignores deleted entries
- added check for maximum clusters according to MS Q184006
- considered -Wextra warnings
- make fatsort detect cluster chain loops
- implemented regression tests
- updated fatsort help information
- Option combination -l and -m now also print long AND short file names
- changed `DE_FREE` to `u_char`
- additional cluster size check
- Optimized calculation of file system information
- Minor changes and code cleaning

## v1.0 (March 11, 2013)
- FIX: exit critical sections on error
- FIX: Natural order sorting works again (without collation ordering though)
- ENHANCEMENT: Added support for FAT12
- Added checks for broken clusterchains
- Added cluster usage information for option -i
- Checksums for LongDirEntries are now verified
- Added integrity check that verifies whether all FATs are the same

## v0.9.17 (April 4, 2012)
- Collation ordering for the current locale is now considered during sorting
- Fixed some random bugs found with a static code analysis tools

## v0.9.16 (December July, 2011)
- Updated address in GPL license

## v0.9.15 (August 15, 2011)
- Multiple directories can now be included and excluded for sorting using options -d, -D, -x, and -X. Thanks to Renaud Métrich for the idea.
- Added option -I which allows to ignore filename prefixes during sorting. Thanks to Matthew Altus for the idea.
- Added support for memory leak detection in debug modes 2-4
- Fixed a bug in function randomizeDirEntryList. Thanks to Renaud Métrich for reporting the bug.
- Updated Makefiles for better Max OS X support. Thanks to Tom Freiberger for the Makefiles.
- Minor change to remove a compiler warning in FAT\_fs.c.
- Minor change to remove a redundant option check.

## v0.9.14.1 (June 11, 2010)
- Check for last directory entry in FAT\_fs.c was fixed. thanks to Peter De Wachter for the hint.

## v0.9.14 (May 14, 2010)
- Included a patch for an iconv issue under Mac and FreeBSD. Thanks to Max Campos.

## v0.9.13.1 (December 12, 2009)
- Fixed a pointer initialization in insertLongDirEntryList

## v0.9.13 (December 23, 2009)
- Added random order sorting (option -R)
- Updated manpage
- manpage is now installed via make install

## v0.9.12 (September 29, 2009)
- locale is now set to locale of environment

## v0.9.11 (September 27, 2009)
- segmentation fault in parseClusterChain fixed
- LFNs are now correctly converted from UTF-16 to UTF-8

## v0.9.10 (May 12, 2008)
- Options -d and -D added
- natural order comparison algorithm reimplemented

## v0.9.9.1 (February 12, 2008)
- Small Makefile update

## v0.9.9 (November 28, 2008)
- Martin Pool's natural order comparison algorithm is now included into FATSort
- Makefile patches

## v0.9.8.3 (July 08, 2008)
- bug in `check_mounted` fixed

## v0.9.8.2 (June 11, 2008)
- minor fixes in header files and make files
- modified README

## v0.9.8.1 (June 10, 2008)
- some minor fixes. Thanks to Till Maas.

## v0.9.8 (Septembe 25, 2007)
- splitted fatsort into several source files
- implemented exclusive file lock (not mandatory)
- signals are blocked while writing to file (implemented critial sections)
- sorting of special directory entries (".", ".." and volume label) is now prevented
- enhanced mount check feature
- -f option to force sorting introduced
- small updates
- thanks to Joe Forster/STA for some fixes

## v0.9.7.1 (April 30, 2007)
- support for files >4GB
- thanks to Sebastian Biallas for the patch

## v0.9.7 (February 01, 2007)
- fatsort now checks if device is mounted (only BSD and linux)
- thanks to Sebastian Dröge for the patch

## v0.9.6.2 (August 01, 2006)
- added option for sorting in reverse order
- fixed some memory leaks
- thanks to Giorgio Moscardi for both patches

## v0.9.6.1 (July 01, 2006)
- removed unused variables, minor changes

## v0.9.6 (June 26, 2006)
- big-endian support added
- getopt fix for PPC
- cluster chains are dynamic structures now
- small fixes
- error handling in FSInfo

## v0.9.5 (May 27, 2006)
- fixed volume label bug
- tidied up some code
- added function assertions
- added error handlings
- changed error messages

## v0.9.4 (September 09, 2005)
- fixed integer issues, included stdlib.h

## v0.9.3 (January 13, 2005)
- fixed some data types because of bugs on opteron systems

## v0.9.2 (January 13, 2005)
- fixed some bugs
- FATSort is now put under GPL

## v0.9.1 (February 06, 2004)
- major bug concerning FAT specification fixed
