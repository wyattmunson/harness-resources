#!/bin/bash

echo "Checking var"

if [ -z "$1" ]; then
  echo "ERROR => Script was called without an argument. Exiting."
  echo "=======> Please provide the environment variable key as an argument."
  exit 1
fi

CHECK_VAR="$1"
echo "Checking for variable: $CHECK_VAR"

# Check if the environment variable exists
if [[ -v "$CHECK_VAR" ]]; then
  echo "INFO: '$CHECK_VAR' is set and has the value: ${!CHECK_VAR}"
else
  echo "ERROR => Environment variable '$CHECK_VAR' is not set."
fi
