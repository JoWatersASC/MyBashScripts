#!/bin/bash

DBG_EXE = $(mktemp /tmp/dbg_exe-XXXXXX)
g++ -O0 -g "$@" -o $DBG_EXE &&
gdb $DBG_EXE &&
rm $DBG_EXE
