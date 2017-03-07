#!/bin/bash

# -------------------------------------
# DESCRIPTION
# -------------------------------------
# CHECK IF DOCKER IS INSTALLED
# RETURN TYPE: BOOL

function check_docker {
  docker -v &> /dev/null
  if [ $? -eq 0 ]; then
    echo true
    exit 0
  else
    echo false
    exit 1
  fi
}
