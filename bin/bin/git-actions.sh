#!/bin/bash

source $HOME/.system/shell_config/env_var.zsh

echo "Below is a list of your github repositories:"

ls $GIT_REPOS | nl

echo "Please type the (exact) name of the repository you want to work on:"

read REPO_NAME

cd $GIT_REPOS/$REPO_NAME || {
  echo "Repository not found! Exiting."
  exit 1
}

git add .

echo "add a commit message:"

read COMMIT_MESSAGE

git commit -m "$COMMIT_MESSAGE" || {
  echo "Commit failed! exiting."
  exit 1
}

git push origin main

if [ $? -eq 0 ]; then
  echo "Push was successful!"
else
  echo "Push failed! Please check for errors and try again."
fi

cd
