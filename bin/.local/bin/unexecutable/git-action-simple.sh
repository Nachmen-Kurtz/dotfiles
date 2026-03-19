#!/bin/bash

git add .

echo "add a commit message:"

read commit_message

git commit -m "$commit_message"

git push origin main

# this is a comment, write by vim editor
# I must good learn and memory the commands for vi/vim editor. beckuse this is teh powerful tool text editor!!!

echo "your work is complete!"
