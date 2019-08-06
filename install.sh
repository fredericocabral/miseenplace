#!/bin/bash

source ./checkers/docker.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' #NO COLOR


setup_vim() {
  mv ~/.vimrc ~/.vimrc_old
  ln -s ~/work/miseenplace/vim/vimrc ~/.vimrc
}

main() {
  setup 'VIM' $(setup_vim)
}

setup() {
  echo -n "$1: "
  $2 &> /dev/null
  [[ $? -eq 0 ]] && echo $(ok) || echo $(fail)
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

main
