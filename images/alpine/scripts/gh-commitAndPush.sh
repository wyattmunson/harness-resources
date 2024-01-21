#!/bin/bash

BASE_PATH=${BASE_PATH:-"./scripts"}
source ${BASE_PATH}/prints.sh 

log "start" "Git commit"
log "info" "Setting git config..."

# change to repo directory if necessary
REPO_LOCATION=${REPO_LOCATION:="."}
log "info" "Accessing repo at '$REPO_LOCATION'"
cd $REPO_LOCATION

# verify require variables are set
TEST_CMD="source ${BASE_PATH}/check-var.sh"
# alias ckvar="$TEST_CMD"
$TEST_CMD "GIT_PAT_TOKEN" "debug"

# checkout if necessary
if [[ -n "$(git branch | grep main)" ]]; then echo "yes"; fi
git checkout

# detect if should checkout
if [[ -n "$GIT_BRANCH" ]]; then
    log "info" "Checking out to branch: $GIT_BRANCH"
    # detect if branch exists
    if [[ -n "$(git branch | grep $GIT_BRANCH)" ]]; then
        log "info" "Branch exists"
        git checkout $GIT_BRANCH
    else
        log "info" "Branch does not exist"
        git checkout -b $GIT_BRANCH
    fi
fi

# Authention and credential setup
log "info" "Loggin in..."
echo $GIT_PAT_TOKEN > .GIT_PAT_TOKEN
gh auth login --with-token < .GIT_PAT_TOKEN
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > .GIT_PAT_TOKEN
rm .GIT_PAT_TOKEN
gh auth setup-git

# generate and set commit author metadata
GIT_EMAIL="${GIT_EMAIL:-"harness-pipeline@example.com"}"
GIT_NAME="${GIT_NAME:-"Harness Pipeline Automation"}"
log "info" "Set git email to: $GIT_EMAIL"
log "info" "Set git name to: $GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# get file paths to commit, else commit all files
GIT_COMMIT_FILES=${GIT_COMMIT_FILES:-"-A"}
log "info" "Commit file path: ${GIT_COMMIT_FILES}"
git add ${GIT_COMMIT_FILES}

# generate commit message
GIT_COMMIT_MESSAGE=${GIT_COMMIT_MESSAGE:-"Files added in Harness pipeline run"}
git commit -m "${GIT_COMMIT_MESSAGE}"

# exit if SKIP_PUSH
if [[ "$SKIP_PUSH" = true ]]; then 
    log "info" "Skipping push to remote"
    exit 0
fi

# update config to push when theres no remote branch upstream
git config --global --add --bool push.autoSetupRemote true
log "info" "Pushing to remote..."
git push


# set upstream if new branch
# if [[ -n "$(git branch | grep $GIT_BRANCH)" ]]; then
#     log "info" "Pushing to existing branch..."
#     git push
# else
#     log "info" "Pushing to new branch..."
#     git push --set-upstream origin $GIT_BRANCH
# fi

log "done" "Git commit"
