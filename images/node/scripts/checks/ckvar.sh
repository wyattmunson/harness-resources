#!/bin/bash

echo "git check dir"
pwd

function ckvar() {


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
    # -z return true if string length is 0 - unset or empty
    # -n retusn true if string length is non-zero - set to some string
    if [[ -v "$CHECK_VAR" ]]; then
        if [[ -z "$CHECK_VAR" ]]; then
            echo "ERROR: Environment variable present, but not set to a value. Exiting"
            echo "ERROR: Populate the environment variable '$CHECK_VAR' with a value."
        else
            echo "INFO : '$CHECK_VAR' is set."
        fi
    else
        echo "ERROR: Environment variable '$CHECK_VAR' is not set."
        if [[ "$2" = "exit" || "$2" = "hard" ]]; then 
            echo "ERROR: The above env variable is required to continue. Exiting."
            exit 1
        elif [ "$2" = "soft" ]; then
            echo "ERROR: You must set the above env variable to continue. Exiting."
            return 1
        elif [ "$2" = "warn" ]; then
            echo "WARN : Variable not set, but not required. Continuing."
        fi
    fi
}