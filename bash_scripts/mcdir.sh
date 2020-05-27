#!/bin/bash
# This file is used to create a directory and then immediately cd into it
# using pre-existing libraries to ensure robust application
mcdir() {
  ## last argument should always be the directory to create
  DIR=$#
  
  ## display the help menu
  if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]
    then
      echo "Usage: [option...] {directory}"
      echo "   -m, --mode                  Sets the access mode for the new directory     "
      echo "   -p, --path                  Create all directories in path                 "
      echo "   -v, --verbose               Displays a message for every directory created "
      echo "   -h, --help                  Shows this helpful information                 "
      echo
      return 0
  fi

  ## print version
  if [ $1 = "--version" ]
    then
      echo "mcdir version 1.0.1"
      return 0
  fi

  ## load the arguments
  for arg
    do
      if [ $arg = "-m" ] || [ $arg = "--mode" ]
        then
          arg++
          MODE=true
          ACCESS=$arg
      fi
      if [ $arg = "-p" ] || [ $arg = "--path" ]
        then
          MKPATH=true
      fi
      if [ $arg = "-v" ] || [ $arg = "--verbose" ]
        then
          VERBOSE=true
      fi
  done

  ## execute function based on arguments provided
  if [ "$MODE" = true ]
    then
      if [ "$MKPATH" = true ]
        then
          if [ "$VERBOSE" = true ]
            then
              mkdir -m $ACCESS -p -v $DIR &>/dev/null
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
      if [ "$VERBOSE" = true ]
        then
          mkdir -m $ACCESS -v $DIR &>/dev/null
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
      if [ "$VERBOSE" = true ]
        then
          mkdir -p -v $DIR &>/dev/null
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
  if [ "$VERBOSE" = true ]
    then
      mkdir -v $DIR &>/dev/null
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
