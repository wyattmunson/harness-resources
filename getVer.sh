#!/bin/bash

DEFAULT_PATH=".version"
VERSION_SEARCH_PATH=$DEFAULT_PATH
VERSION_NUMBER="9000"

echo "== GET VERSION NUMBER =="

echo "Checking version path..."

if [ -z "${VERSION_PATH}" ]; then
    echo "Using default path: $DEFAULT_PATH"
else
    echo "Version path provided: ${VERSION_PATH}"
    VERSION_SEARCH_PATH=$VERSION_PATH
fi

echo "Getting version number..."
echo Checking for version at: $VERSION_SEARCH_PATH

# check for version file, extract version number
if test -f "$VERSION_SEARCH_PATH" ; then
    echo Found version file
    VERSION_NUMBER=$(cat $VERSION_SEARCH_PATH)
    echo Version number set to: $VERSION_NUMBER
else
    echo "ERROR: Did not find version file"
    echo "==> Expected version file at: $VERSION_SEARCH_PATH"
    echo "==> Use env var VERSION_SEARCH_PATH to set version path"
    
    exit 1
fi