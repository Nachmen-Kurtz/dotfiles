#!/bin/bash

echo "Below is a list of your github repositories:"

ls ~/git | nl

echo "Please type the (exact) name of the repository you want to work on:"

read repo_name

cd ~/git/$repo_name || { echo "Repository not found! Exiting."; exit 1; }

git add .

echo "add a commit message:"

read commit_message

git commit -m "$commit_message" || { echo "Commit failed! exiting."; exit 1; }

git push origin main

if [ $? -eq 0 ]; then
    echo "Push was successful!"
else
    echo "Push failed! Please check for errors and try again."
fi

echo "your work is complete!"

cd
