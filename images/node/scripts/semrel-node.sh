#!/bin/bash

BASE_PATH=${BASE_PATH:-"/opt/wm/scripts"}
source ${BASE_PATH}/checks/ckvar.sh
source ${BASE_PATH}/checks/git-check.sh

pwd
ls

echo "sourcing from ${BASE_PATH}/checks/ckvar.sh"

# CHECK / FIND CODEBASE
# TODO: send warning if not provided
REPO_LOCATION=${REPO_LOCATION:-"."}
cd $REPO_LOCATION

# CHECK FOR VARS

ckvar "GITHUB_TOKEN" "soft"

# CHECK FOR GIT REPO
git_check

# RUN SEMANTIC RELEASE
npx semantic-release | tee semver-output.txt

# get version from release
export NEXT_VERSION=$(cat semver-output.txt | grep "The next release version is" | grep -Eo '\d+\.\d+\.\d+')
# PREVIOUS_VERSION=$(cat version.txt | grep "associated with version" | grep -Eo '\d+\.\d+\.\d+')

