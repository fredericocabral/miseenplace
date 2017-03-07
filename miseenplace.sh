#!/bin/bash

source ./checkers/phantomjs.sh
source ./checkers/docker.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' #NO COLOR

main() {
  check 'Docker' $(check_docker)
  check 'PhantomJS' $(check_phantom)
}

# --------------------------------------------------------------------------
# DESC: Print a success  message with green color
# --------------------------------------------------------------------------
ok() {
  echo -e "${GREEN}[OK]${NC}"
}

# --------------------------------------------------------------------------
# DESC: Print a Error message with RED color
# --------------------------------------------------------------------------
fail() {
  echo -e "${RED}[FAIL]${NC}"
}

# --------------------------------------------------------------------------
# DESC: Check if a given software/tool is installed
# --------------------------------------------------------------------------
# $1 -> Description will be printed
# $2 -> Checker function
check() {
  echo -n "$1: "
  $2 &> /dev/null
  [[ $? -eq 0 ]] && echo $(ok) || echo $(fail)
}

main
