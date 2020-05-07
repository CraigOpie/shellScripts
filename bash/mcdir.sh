#!/bin/bash
# This file is used to create a directory and then immediately cd into it
# using pre-existing libraries to ensure robust application
mcdir() {
  if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]
    then
      echo "Usage: [option...] {directory}"
      echo "   -p, --path                  Create all directories in path "
      echo "   -h, --help                  Shows this helpful information "
      echo
      return 0
  fi
  ## create directory with a path
  if [ $1 = "-p" ] || [ $1 = "--path" ]
    then
      mkdir -p "$2" &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "There was a problem creating your directory."
          return 1
      fi
      cd "$2" &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "Unable to change into that directory."
          return 1
      fi
      return 0
  fi
  ## create directory in this location
  mkdir "$1" &>/dev/null
  if [ $? -gt 0 ]
    then
      echo "There was a problem creating your directory."
      return 1
  fi
  cd "$1" &>/dev/null
  if [ $? -gt 0 ]
    then
      echo "Unable to change into that directory."
      return 1
  fi
  return 0
}
export -f mcdir
