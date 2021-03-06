#!/bin/bash

# -------------------------------------
# DESCRIPTION
# -------------------------------------
# CHECK IF PHANTOMJS IS INSTALLED
# RETURN TYPE: BOOL

function check_phantom {
  phantomjs -v &> /dev/null
  if [ $? -eq 0 ]; then
    echo true
    exit 0
  else
    echo false
    exit 1
  fi
}
