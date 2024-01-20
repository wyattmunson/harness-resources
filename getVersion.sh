#!/bin/bash

DEFAULT_PATH=".version"
VERSION_PATH="${1:-$DEFAULT_PATH}"
VERSION_NUMBER="9000"

echo "== GET VERSION NUMBER =="
echo "Getting version number..."
echo Checking for version at: $VERSION_PATH

# check for version file, extract version number
if test -f "$VERSION_PATH" ; then
    echo Found version file
    VERSION_NUMBER=$(cat $VERSION_PATH)
    echo Version number set to: $VERSION_NUMBER
else
    echo "ERROR: Did not find version file"
    echo "ERROR: Expected version file at: $VERSION_PATH"

    exit 1
fi
