#!/bin/bash

# source ./ckvar.sh


# CHECK / FIND CODEBASE
# TODO: send warning if not provided
REPO_LOCATION=${REPO_LOCATION:-"."}
cd $REPO_LOCATION

# CHECK FOR GIT REPO

# RUN SEMANTIC RELEASE
npx semantic-release
