#!/bin/bash
# This file is used to create a directory and then immediately cd into it
# using pre-existing libraries to ensure robust application
function mcdir() {
  ## display the help menu
  if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]
    then
      echo "Usage: [option...] {directory}"
      echo "   -m, --mode                  Sets the access mode for the new directory     "
      echo "   -p, --path                  Create all directories in path                 "
      echo "   -h, --help                  Shows this helpful information                 "
      echo
      return 0
  fi

  ## set default variables
  MODE=false
  MKPATH=false
  STDMK=true
  ACCESS=777
  DIR="$1"

  ## print version
  if [ $1 = "--version" ]
    then
      echo "mcdir version 1.0.1"
      return 0
  fi

  ## load the arguments
  while [ "$1" != "" ]
    do
      DIR="$1"
      if [ $1 = "-m" ] || [ $1 = "--mode" ]
        then
          shift
          MODE=true
          STDMK=false
          ACCESS=$1
      fi
      if [ $1 = "-p" ] || [ $1 = "--path" ]
        then
          MKPATH=true
          STDMK=false
      fi
      shift
  done

  ## execute function based on arguments provided
  if [ "$MODE" = true ]
    then
      if [ "$MKPATH" = true ]
        then
          mkdir -m $ACCESS -p $DIR &>/dev/null
          if [ $? -gt 0 ]
            then
              echo "There was a problem creating your directory."
              return 1
          fi
          cd "$DIR" &>/dev/null
          if [ $? -gt 0 ]
            then
              echo "Unable to change into that directory."
              return 1
          fi
          return 0
      fi
      mkdir -m $ACCESS $DIR &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "There was a problem creating your directory."
          return 1
      fi
      cd "$DIR" &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "Unable to change into that directory."
          return 1
      fi
      return 0
  fi
  if [ "$MKPATH" = true ]
    then
      mkdir -p $DIR &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "There was a problem creating your directory."
          return 1
      fi
      cd "$DIR" &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "Unable to change into that directory."
          return 1
      fi
      return 0
  fi
  if [ "$STDMK" = true ]
    then
      mkdir $DIR &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "There was a problem creating your directory."
          return 1
      fi
      cd "$DIR" &>/dev/null
      if [ $? -gt 0 ]
        then
          echo "Unable to change into that directory."
          return 1
      fi
      return 0
  fi
  return 0
}
export -f mcdir
