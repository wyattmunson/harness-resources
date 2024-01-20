#!/bin/bash

echo "Checking var"

if [ -z "$1" ]; then
  echo "ERROR => Script was called without an argument. Exiting."
  echo "=======> Please provide the environment variable key as an argument."
  exit 1
fi

CHECK_VAR=$1
echo "Checking for variable: $CHECK_VAR"

# check if length=0

# Check if variable exists
if [ ${CHECK_VAR} ]; then
    echo "INFO: Varible $CHECK_VAR exists"
else
    echo "WARN: $CHECK_VAR does not exist"
fi

# Check if variable is set to a value
if [ -z "${CHECK_VAR}" ]; then
    echo "WARN: $CHECK_VAR is unset or set to an empty string"
else
    echo "INFO: $CHECK_VAR exists and is set to '$CHECK_VAR'"
fi


# if [[ ! "$1" ]]; then
#     echo "ERR: Call this script with an argument of the environment variable to check"
#     exit 1
# fi

# # Check if the variable exists
# if [ -v "$1" ]; then
#     # Check if the variable is set to a non-empty value
#     if [[ -n "$1" ]]; then
#         echo "The variable $1 is set to: $1"
#     else
#         echo "The variable $1 exists but is empty."
#     fi
# else
#     echo "The variable $1 does not exist."
# fi

# # two
# if [[ -n "$1" ]]; then  # Check if $1 is not empty
#     CHECK_VAR=$1
#     if [[ -v "$CHECK_VAR" ]]; then  # Check if $1 is set (exists)
#         echo "Argument $CHECK_VAR is set to '$CHECK_VAR'"
#         # Perform actions based on the argument's value
#     else
#         echo "Argument $CHECK_VAR is unset, but it was passed as an empty value"
#         # Handle the case where the argument is unset but passed as empty
#     fi
# else
#     echo "Argument $1 is missing"
#     # Handle the case where the argument is not provided at all
# fi



# Capture the environment variable key from the argument
# ENV_VAR_KEY="$1"

# Check if the environment variable exists
# if [[ -v "$ENV_VAR_KEY" ]]; then
#   echo "The environment variable '$ENV_VAR_KEY' is set and has the value: ${!ENV_VAR_KEY}"
# else
#   echo "The environment variable '$ENV_VAR_KEY' is not set."
# fi

# if [ -n "${ENV_VAR_KEY}" ]; then
#     echo "$ENV_VAR_KEY is set"
# else
#     echo "Not set"
# fi

# if [[ -v "${ENV_VAR_KEY}" ]]; then
#     echo "MY_VARIABLE is set"
# else
#     echo "MY_VARIABLE is unset"
# fi