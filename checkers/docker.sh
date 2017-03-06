#!/bin/bash

# -------------------------------------
# DESCRIPTION
# -------------------------------------
# CHECK IF DOCKER IS INSTALLED
# RETURN TYPE: BOOL

docker -v &> /dev/null
[[ $? -eq 0 ]] && echo "true" || echo "false"
