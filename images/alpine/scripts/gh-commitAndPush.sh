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
AUTHOR_EMAIL="${AUTHOR_EMAIL:-"harness-pipeline@example.com"}"
AUTHOR_NAME="${AUTHOR_NAME:-"Harness Pipeline Automation"}"
log "info" "Set git email to: $AUTHOR_EMAIL"
log "info" "Set git name to: $AUTHOR_NAME"
git config --global user.email "$AUTHOR_EMAIL"
git config --global user.name "$AUTHOR_NAME"

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

log "done" "Git commit"
