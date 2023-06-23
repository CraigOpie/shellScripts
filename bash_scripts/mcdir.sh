#!/bin/bash
# This file is used to create a directory and then immediately cd into it
# using pre-existing libraries to ensure robust application

function mcdir() {
  if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]
    then
      echo "Usage: mcdir [-m MODE] [-p] DIRECTORY"
      echo "Create a directory and change into it."
      echo
      echo "Options:"
      echo "   -m, --mode MODE     Sets the access mode for the new directory. Default is 755."
      echo "   -p, --path          Create all directories in path."
      echo "   -h, --help          Shows this helpful information."
      echo
      echo "Examples:"
      echo "   mcdir -m 777 new_dir"
      echo "   mcdir -p new_dir/sub_dir"
      return 0
  fi

  # set default variables
  local accessMode=755
  local makePath=false
  local directory

  while (( "$#" )); do
    case "$1" in
      -m|--mode)
        if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
          accessMode=$2
          shift 2
        else
          echo "Error: Argument for $1 is missing" >&2
          exit 1
        fi
        ;;
      -p|--path)
        makePath=true
        shift
        ;;
      -*|--*=) 
        echo "Error: Unsupported flag $1" >&2
        exit 1
        ;;
      *)
        directory=$1
        shift
        ;;
    esac
  done

  # execute function based on arguments provided
  local mkdirCommand="mkdir -m $accessMode"
  
  if [ "$makePath" = true ]; then
    mkdirCommand+=" -p"
  fi
  
  $mkdirCommand "$directory"
  if [ $? -ne 0 ]; then
    echo "There was a problem creating your directory."
    return 1
  fi

  cd "$directory"
  if [ $? -ne 0 ]; then
    echo "Unable to change into that directory."
    return 1
  fi

  return 0
}
export -f mcdir
