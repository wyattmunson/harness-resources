#!/bin/bash

echo "START: Environment variable check"



if [ -z "$1" ]; then
  echo "ERROR: Script was called without an argument. Exiting."
  echo "ERROR: Please provide the environment variable key as an argument."
  echo "ERROR: Example: '$0 SOME_VAR'"

  exit 1
fi

CHECK_VAR="$1"
echo "INFO : Checking for variable: $CHECK_VAR"

# Check if the environment variable exists
# -v returns true if VAR is set
if [[ -v "$CHECK_VAR" ]]; then
    # check if it's populated
    # if [[ ! -z "$CHECK_VAR" ]]; then
    # -z return true if string length is 0 - unset or empty
    # -n retusn true if string length is non-zero - set to some string
    if [[ -z "$CHECK_VAR" ]]; then
        # if [ "$2" = "exit" ]; then exit 1; fi
        echo "ERROR: Environment variable present, but not set to a value. Exiting"
        echo "ERROR: Populate the environment variable '$CHECK_VAR' with a value."
    else
        echo "INFO : '$CHECK_VAR' is set"
    fi
else
    echo "ERROR: Environment variable '$CHECK_VAR' is not set."
    if [ "$2" = "exit" ]; then exit 1; fi
fi

echo "DONE : Environment variable check"